contract c655{
    /**
        @dev Performs the purchase of a token that is present on the market - this includes checking that the
            proper amount is sent + appliced fee, updating seller's balance, updated collected fees and
            transfering token to buyer
            Only market tokens can be purchased
        @param tokenId ID of the token we wish to purchase
    */
    function purchaseToken(uint256 tokenId) external payable 
    whenNotPaused()
    isOnMarket(tokenId) 
    tokenAvailable()
    notOriginalOwnerOf(tokenId)
    {
        //Did the sender accidently pay over? - if so track the amount over
        uint256 totalToPay = getTokenPrice(tokenId);
        require(msg.value >= totalToPay, "Not paying enough");
        //fetch this tokens sale data
        SaleData memory sale = market[tokenId];
        //Add to collected fee amount payable to DEVS
        collectedFees += totalToPay - sale.price;
        //pay the seller
        sale.owner.transfer(sale.price);
        //Reset barn tracker for user
        _removeTokenFromBarn(tokenId,  sale.owner);
        //Reset token on market - remove
        delete market[tokenId];
        //Transfer the ERC721 to the buyer - we leave the sale amount
        //to be withdrawn by the user (transferred from exchange)
        token.transferFrom(address(this), msg.sender, tokenId);
        //Return over paid amount to sender if necessary
        if(msg.value > totalToPay) //overpaid
        {
            msg.sender.transfer(msg.value.sub(totalToPay));
        }
        emit HorseyPurchased(tokenId, msg.sender, totalToPay);
    }
}