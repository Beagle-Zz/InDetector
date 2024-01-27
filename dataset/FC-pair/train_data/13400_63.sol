contract c13400{
    /// @notice Current mintable MET in auction
    function currentMintable() public view returns (uint) {
        uint currMintable = mintable;
        uint currAuction = currentAuction();
        uint totalAuctions = currAuction.sub(whichAuction(lastPurchaseTick));
        if (totalAuctions > 0) {
            currMintable = mintable.add(nextAuctionSupply(totalAuctions));
        }
        return currMintable;
    }
}