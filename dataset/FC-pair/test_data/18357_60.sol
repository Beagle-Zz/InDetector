contract c18357{
    // ------------------------------------------------------------------------
    // Put order on the blackmarket to sell a certain quantity of coke at a certain price.
    // The price ratio is how much micrograms (ug) of material (tokens) the buyer will get per ETH (ug/ETH) (for example, to get 10g for 1 ETH, the ratio should be 10000000)
    // For sellers the lower the ratio the better, the more ETH the buyer will need to spend to get each token!
    // - Seller must have enough balance of tokens
    // ------------------------------------------------------------------------
    function sellToBlackMarket(uint quantity, uint priceRatio) public whenNotPaused whenNotFlushing returns (bool success, uint numOrderCreated) {
        //require(quantity <= balances[msg.sender]block.number >= toFlush[msg.sender]);
        //CHeck if user has sufficient balance to do a sell offer:
        if(quantity > balances[msg.sender]) {
            //Seller is missing funds: Abort order:
            emit OrderInsufficientBalance(msg.sender, quantity, balances[msg.sender]);
            return (false, 0);
        }
        //Insert order in the sorted list (from cheaper to most expensive)
        //Find an offer that is more expensive:
        //nodeMoreExpensive = 
        uint nextSpot;
        bool foundPosition;
        uint sizeNow;
        (nextSpot, foundPosition, sizeNow) = blackMarketOffersSorted.getSortedSpotByFunction(HEAD, priceRatio, NEXT, smallerPriceComparator, maxMarketOffers);
        if(foundPosition) {
            //Create new Sell Offer:
            uint newNodeNum = ++marketOfferCounter; //SAFETY CHECK: Doesn't matter if we cycle again from MAX_INT to 0, as we have only 100 maximum offers at a time, so there will never be some overwriting of valid offers!
            blackMarketOffersMap[newNodeNum].quantity = quantity;
            blackMarketOffersMap[newNodeNum].price = priceRatio;
            blackMarketOffersMap[newNodeNum].seller = msg.sender;
            //Insert cheaper offer before nextSpot:
            blackMarketOffersSorted.insert(nextSpot, newNodeNum, PREV);
            if(int32(sizeNow) > maxMarketOffers) {
                //Delete the tail element so we can keep the same number of max market offers:
                uint lastIndex = blackMarketOffersSorted.pop(PREV); //Pops and removes last element of the list!
                delete blackMarketOffersMap[lastIndex];
            }
            emit BlackMarketOfferAvailable(quantity, priceRatio);
            return (true, newNodeNum);
        }
        else {
            return (false, 0);
        }
    }
}