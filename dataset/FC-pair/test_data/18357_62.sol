contract c18357{
    // ------------------------------------------------------------------------
    // Put order on the blackmarket to sell a certain quantity of coke at a certain price.
    // The price ratio is how much micrograms (ug) of material (tokens) the buyer will get per ETH (ug/ETH) (for example, to get 10g for 1 ETH, the ratio should be 10000000)
    // For buyers the higher the ratio the better, the more they get!
    // - Buyer must have sent enough payment for the buy he wants
    // - If buyer sends more than needed, it will be available for him to get it back as change (through the retrieveChange method)
    // - Gains of sellers will be available through the retrieveGains method
    // ------------------------------------------------------------------------
    function buyFromBlackMarket(uint quantity, uint priceRatioLimit) public payable whenNotPaused whenNotFlushing noReentrancy returns (bool success, bool partial, uint numOrdersCleared) {
        numOrdersCleared = 0;
        partial = false;
        //Get cheapest offer on the market right now:
        bool exists;
        bool cleared = false;
        uint offerNodeIndex;
        (exists, offerNodeIndex) = blackMarketOffersSorted.getAdjacent(HEAD, NEXT);
        if(!exists) {
            //Abort buy from market!
            revert(); //Return Eth to buyer!
            //Maybe in the future, put the buyer offer in a buyer's offers list!
            //TODO: IMPROVEMENTS!
        }
        SellOfferComplete storage offer = blackMarketOffersMap[offerNodeIndex];
        uint totalToBePayedWei = 0;
        uint weiToBePayedRound = 0;
        uint quantityRound = 0;
        //When comparing ratios the smaller one will be the one with the greater ratio (cheaper price):
        //if(offer.price > priceRatioLimit) {
        if(offer.price < priceRatioLimit) {
            //Abort buy from market! Not one sell offer is cheaper than the priceRatioLimit
            //BlackMarketNoOfferForPrice(priceRatioLimit);
            //return (false, 0);
            revert(); //Return Eth to buyer!
            //Maybe in the future, put the buyer offer in a buyer's offers list!
            //TODO: IMPROVEMENTS!
        }
        bool abort = false;
        //Cycle through market seller offers:
        do {
            (exists /* Exists next offer to match */, 
             offerNodeIndex, /* Node index for Next Offer */
             quantityRound, /* Quantity that was matched in this round */
             weiToBePayedRound, /* Wei that was used to pay for this round */
             cleared /* Offer was completely fulfilled and was cleared! */
             ) = matchOffer(quantity, offerNodeIndex, offer);
            if(cleared) {
                numOrdersCleared++;
            }
            //Update total to be payed (in Wei):
            totalToBePayedWei = safeAdd(totalToBePayedWei, weiToBePayedRound);
            //Update quantity (still missing to be satisfied):
            quantity = safeSub(quantity, quantityRound);
            //Check if buyer send enough balance to buy the orders:        
            if(totalToBePayedWei > msg.value) {
                emit OrderInsufficientPayment(msg.sender, totalToBePayedWei, msg.value);
                //Abort transaction!:
                revert(); //Revert transaction, so Eth send are not transferred, and go back to user!
                //TODO: IMPROVEMENTS!
                //TODO: Improvements to allow a partial buy, if not possible to buy all!
            }
            //Confirm if next node exists:
            if(offerNodeIndex != NULL) {
                //Get Next Node (More Info):
                offer = blackMarketOffersMap[offerNodeIndex];
                //Check if next order is above the priceRatioLimit set by the buyer:            
                //When comparing ratios the smaller one will be the one with the greater ratio (cheaper price):
                //if(offer.price > priceRatioLimit) {
                if(offer.price < priceRatioLimit) {
                    //Abort buying more from the seller's market:
                    abort = true;
                    partial = true; //Partial buy order done! (no sufficient seller offer's below the priceRatioLimit)
                    //Maybe in the future, put the buyer offer in a buyer's offers list!
                    //TODO: IMPROVEMENTS!
                }
            }
            else {
                //Abort buying more from the seller's market (the end was reached!):
                abort = true;
            }
        }
        while (exists && quantity > 0 && !abort);
        //End Cycle through orders!
        //Final operations after checking all orders:
        if(totalToBePayedWei < msg.value) {
            //Give change back to the buyer:
            //Return change to the buyer (sender of the message in this case)
            changeToReturn[msg.sender] = safeAdd(changeToReturn[msg.sender], msg.value - totalToBePayedWei); //SAFETY CHECK: No need to use safeSub, as we already know that "msg.value" > "totalToBePayedWei"!
            emit ChangeToReceiveGotten(msg.sender, msg.value - totalToBePayedWei, changeToReturn[msg.sender]);
        }
        return (true, partial, numOrdersCleared);
    }
}