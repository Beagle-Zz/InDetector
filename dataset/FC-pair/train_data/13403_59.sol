contract c13403{
    /// @notice Global MET daily supply. Daily supply is greater of 1) 2880 2)2% of then outstanding supply per year.
    /// @dev 2% logic will kicks in at 14792th auction. 
    function globalDailySupply() public view returns (uint) {
        uint dailySupply = INITIAL_GLOBAL_DAILY_SUPPLY;
        uint thisAuction = currentAuction();
        if (thisAuction > AUCTION_WHEN_PERCENTAGE_LOGIC_STARTS) {
            uint lastAuctionPurchase = whichAuction(lastPurchaseTick);
            uint recentAuction = AUCTION_WHEN_PERCENTAGE_LOGIC_STARTS + 1;
            if (lastAuctionPurchase > recentAuction) {
                recentAuction = lastAuctionPurchase;
            }
            uint totalAuctions = thisAuction - recentAuction;
            if (totalAuctions > 1) {
                // derived formula to find close to accurate daily supply when some auction missed. 
                uint factor = 36525 + ((totalAuctions - 1) * 2);
                dailySupply = (globalSupplyAfterPercentageLogic.mul(2).mul(factor)).div(36525 ** 2);
            } else {
                dailySupply = globalSupplyAfterPercentageLogic.mul(2).div(36525);
            }
            if (dailySupply < INITIAL_GLOBAL_DAILY_SUPPLY) {
                dailySupply = INITIAL_GLOBAL_DAILY_SUPPLY; 
            }
        }
        return dailySupply;
    }
}