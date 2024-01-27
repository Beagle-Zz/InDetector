contract c13401{
    /// @notice Return the information about the next auction
    /// @return _startTime Start time of next auction
    /// @return _startPrice Start price of MET in next auction
    /// @return _auctionTokens  MET supply in next auction
    function nextAuction() internal constant returns(uint _startTime, uint _startPrice, uint _auctionTokens) {
        if (block.timestamp < genesisTime) {
            _startTime = genesisTime;
            _startPrice = lastPurchasePrice;
            _auctionTokens = mintable;
            return;
        }
        uint recentAuction = whichAuction(lastPurchaseTick);
        uint currAuc = currentAuction();
        uint totalAuctions = currAuc - recentAuction;
        _startTime = dailyAuctionStartTime;
        if (currAuc > 1) {
            _startTime = auctionStartTime(currentTick());
        }
        _auctionTokens = nextAuctionSupply(totalAuctions);
        if (totalAuctions > 1) {
            _startPrice = lastPurchasePrice / 100 + 1;
        } else {
            if (mintable == 0 || totalAuctions == 0) {
                // Sold out scenario or someone querying projected start price of next auction
                _startPrice = (lastPurchasePrice * 2) + 1;   
            } else {
                // Timed out and all tokens not sold.
                if (currAuc == 1) {
                    // If initial auction timed out then price before start of new auction will touch floor price
                    _startPrice = minimumPrice * 2;
                } else {
                    // Descending price till end of auction and then multiply by 2
                    uint tickWhenAuctionEnded = whichTick(_startTime);
                    uint numTick = 0;
                    if (tickWhenAuctionEnded > lastPurchaseTick) {
                        numTick = tickWhenAuctionEnded - lastPurchaseTick;
                    }
                    _startPrice = priceAt(lastPurchasePrice, numTick) * 2;
                }
            }
        }
    }
}