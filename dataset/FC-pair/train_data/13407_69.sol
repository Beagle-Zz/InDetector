contract c13407{
    /// @notice price at a number of minutes out in Initial auction and daily auction
    /// @param _tick Metronome tick
    /// @return weiPerToken
    function calcPriceAt(uint _tick) internal constant returns (uint weiPerToken) {
        uint recentAuction = whichAuction(lastPurchaseTick);
        uint totalAuctions = whichAuction(_tick).sub(recentAuction);
        uint prevPrice;
        uint numTicks = 0;
        // Auction is sold out and metronome clock is in same auction
        if (mintable == 0 && totalAuctions == 0) {
            return lastPurchasePrice;
        }
        // Metronome has missed one auction ie no purchase in last auction
        if (totalAuctions > 1) {
            prevPrice = lastPurchasePrice / 100 + 1;
            numTicks = numTicksSinceAuctionStart(_tick);
        } else if (totalAuctions == 1) {
            // Metronome clock is in new auction, next auction
            // previous auction sold out
            if (mintable == 0) {
                prevPrice = lastPurchasePrice * 2;
            } else {
                // previous auctions timed out
                // first daily auction
                if (whichAuction(_tick) == 1) {
                    prevPrice = minimumPrice * 2;
                } else {
                    prevPrice = priceAt(lastPurchasePrice, numTicksTillAuctionStart(_tick)) * 2;
                }
            }
            numTicks = numTicksSinceAuctionStart(_tick);
        } else {
            //Auction is running
            prevPrice = lastPurchasePrice;
            numTicks = _tick - lastPurchaseTick;
        }
        require(numTicks >= 0);
        if (isInitialAuctionEnded()) {
            weiPerToken = priceAt(prevPrice, numTicks);
        } else {
            weiPerToken = priceAtInitialAuction(prevPrice, numTicks);
        }
    }
}