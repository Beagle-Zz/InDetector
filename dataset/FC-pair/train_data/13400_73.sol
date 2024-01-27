contract c13400{
    /// @notice start the next day's auction
    function restartAuction() private {
        uint time;
        uint price;
        uint auctionTokens;
        (time, price, auctionTokens) = nextAuction();
        uint thisAuction = currentAuction();
        if (thisAuction > AUCTION_WHEN_PERCENTAGE_LOGIC_STARTS) {
            globalSupplyAfterPercentageLogic = globalSupplyAfterPercentageLogic.add(globalDailySupply());
        }
        mintable = mintable.add(auctionTokens);
        lastPurchasePrice = price;
        lastPurchaseTick = whichTick(time);
    }
}