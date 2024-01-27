contract c18357{
    // ------------------------------------------------------------------------
    // Buys from a trusted dealer.
    // The buyer has to send the needed Ether to pay for the quantity of material specified at that priceRatio (the buyer can use 
    // checkSellerOffer(), and input the seller address to know the quantity and priceRatio specified and also, of course, how much Ether in Wei
    // he/she will have to pay for it).
    // The price ratio is how much micrograms (ug) of material (tokens) the buyer will get per ETH (ug/ETH)
    // ------------------------------------------------------------------------
    function buyFromTrusterDealer(address dealer, uint quantity, uint priceRatio) public payable noReentrancy whenNotPaused returns (bool success) {
        //Check up on offer:
        require(directOffers[dealer][msg.sender].quantity > 0 && directOffers[dealer][msg.sender].price > 0); //Offer exists?
        if(quantity > directOffers[dealer][msg.sender].quantity) {
            emit OrderQuantityMismatch(dealer, directOffers[dealer][msg.sender].quantity, quantity);
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], msg.value); //Operation aborted: The buyer can get its ether back by using retrieveChange().
            emit ChangeToReceiveGotten(msg.sender, msg.value, changeToReturn[msg.sender]);
            return false;
        }
        if(directOffers[dealer][msg.sender].price != priceRatio) {
            emit OrderPriceMismatch(dealer, directOffers[dealer][msg.sender].price, priceRatio);
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], msg.value); //Operation aborted: The buyer can get its ether back by using retrieveChange().
            emit ChangeToReceiveGotten(msg.sender, msg.value, changeToReturn[msg.sender]);
            return false;
        }
        //Offer valid, start buying proccess:
        //Get values to be payed:
        uint weiToBePayed = calculateEthValueFromTokens(quantity, priceRatio);
        //Check eth payment from buyer:
        if(msg.value < weiToBePayed) {
            emit OrderInsufficientPayment(msg.sender, weiToBePayed, msg.value);
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], msg.value); //Operation aborted: The buyer can get its ether back by using retrieveChange().
            emit ChangeToReceiveGotten(msg.sender, msg.value, changeToReturn[msg.sender]);
            return false;
        }
        //Check balance from seller:
        if(quantity > balances[dealer]) {
            //Seller is missing funds: Abort order:
            emit OrderInsufficientBalance(dealer, quantity, balances[dealer]);
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], msg.value); //Operation aborted: The buyer can get its ether back by using retrieveChange().
            emit ChangeToReceiveGotten(msg.sender, msg.value, changeToReturn[msg.sender]);
            return false;
        }
        //Update balances of seller/buyer:
        balances[dealer] = balances[dealer] - quantity; //SAFETY CHECK: No need to use safeSub, as we already know that "balances[dealer]" >= "quantity"!
        balances[msg.sender] = safeAdd(balances[msg.sender], quantity);
        emit Transfer(dealer, msg.sender, quantity);
        //Update direct offers registry:
        if(quantity < directOffers[dealer][msg.sender].quantity) {
            //SAFETY CHECK: No need to use safeSub, as we already know that "directOffers[dealer][msg.sender].quantity" > "quantity"!
            directOffers[dealer][msg.sender].quantity = directOffers[dealer][msg.sender].quantity - quantity;
        }
        else {
            //Remove offer from registry (order completely filled)
            delete directOffers[dealer][msg.sender];
        }
        //Receive payment from one user and send it to another, minus the comission:
        //Calculate fees and values to distribute:
        uint fee = safeDiv(weiToBePayed, directOffersComissionRatio);
        uint valueForSeller = safeSub(weiToBePayed, fee);
        //SAFETY CHECK: Possible Denial of Service, by putting a fallback function impossible to run: No problem! As this is a direct offer between two users, if it doesn't work the first time, the user can just ignore the offer!
        //SAFETY CHECK: No Reentrancy possible: Modifier active!
        //SAFETY CHECK: Balances are all updated before transfer, and offer is removed/updated too! Only change is updated later, which is good as user can only retrieve the funds after this operations finishes with success!
        dealer.transfer(valueForSeller);
        //Set change to the buyer if he sent extra eth:
        uint changeToGive = safeSub(msg.value, weiToBePayed);
        if(changeToGive > 0) {
            //Update change values (user will have to retrieve the change calling method "retrieveChange" to receive the Eth)
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], changeToGive);
            emit ChangeToReceiveGotten(msg.sender, changeToGive, changeToReturn[msg.sender]);
        }
        return true;
    }
}