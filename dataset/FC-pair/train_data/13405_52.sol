contract c13405{
    /// @notice one single function telling everything about Metronome Auction
    function heartbeat() public view returns (
        bytes8 _chain,
        address auctionAddr,
        address convertAddr,
        address tokenAddr,
        uint minting,
        uint totalMET,
        uint proceedsBal,
        uint currTick,
        uint currAuction,
        uint nextAuctionGMT,
        uint genesisGMT,
        uint currentAuctionPrice,
        uint _dailyMintable,
        uint _lastPurchasePrice) {
        _chain = chain;
        convertAddr = proceeds.autonomousConverter();
        tokenAddr = token;
        auctionAddr = this;
        totalMET = token.totalSupply();
        proceedsBal = address(proceeds).balance;
        currTick = currentTick();
        currAuction = currentAuction();
        if (currAuction == 0) {
            nextAuctionGMT = dailyAuctionStartTime;
        } else {
            nextAuctionGMT = (currAuction * DAY_IN_SECONDS) / timeScale + dailyAuctionStartTime;
        }
        genesisGMT = genesisTime;
        currentAuctionPrice = currentPrice();
        _dailyMintable = dailyMintable();
        minting = currentMintable();
        _lastPurchasePrice = lastPurchasePrice;
    }
}