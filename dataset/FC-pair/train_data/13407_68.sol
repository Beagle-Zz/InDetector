contract c13407{
    /// @notice MET supply for next Auction also considering  carry forward met.
    /// @param totalAuctionMissed auction count when no purchase done.
    function nextAuctionSupply(uint totalAuctionMissed) internal view returns (uint supply) {
        uint thisAuction = currentAuction();
        uint tokensHere = token.totalSupply().add(mintable);
        supply = INITIAL_GLOBAL_DAILY_SUPPLY;
        uint dailySupplyAtLastPurchase;
        if (thisAuction > AUCTION_WHEN_PERCENTAGE_LOGIC_STARTS) {
            supply = globalDailySupply();
            if (totalAuctionMissed > 1) {
                dailySupplyAtLastPurchase = globalSupplyAfterPercentageLogic.mul(2).div(36525);
                supply = dailySupplyAtLastPurchase.add(supply).mul(totalAuctionMissed).div(2);
            } 
            supply = (supply.mul(tokensHere)).div(globalSupplyAfterPercentageLogic);
        } else {
            if (totalAuctionMissed > 1) {
                supply = supply.mul(totalAuctionMissed);
            }
            uint previousGlobalMetSupply = 
            INITIAL_SUPPLY.add(INITIAL_GLOBAL_DAILY_SUPPLY.mul(whichAuction(lastPurchaseTick)));
            supply = (supply.mul(tokensHere)).div(previousGlobalMetSupply);
        }
    }
}