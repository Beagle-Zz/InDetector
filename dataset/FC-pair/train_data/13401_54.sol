contract c13401{
    /// @notice Initialize Auctions parameters
    /// @param _startTime The block.timestamp when first auction starts
    /// @param _minimumPrice Nobody can buy tokens for less than this price
    /// @param _startingPrice Start price of MET when first auction starts
    /// @param _timeScale time scale factor for auction. will be always 1 in live environment
    function initAuctions(uint _startTime, uint _minimumPrice, uint _startingPrice, uint _timeScale) 
        public onlyOwner returns (bool) 
    {
        require(minted);
        require(!initialized);
        require(_timeScale != 0);
        initPricer();
        if (_startTime > 0) { 
            genesisTime = (_startTime / (1 minutes)) * (1 minutes) + 60;
        } else {
            genesisTime = block.timestamp + 60 - (block.timestamp % 60);
        }
        initialAuctionEndTime = genesisTime + initialAuctionDuration;
        // if initialAuctionEndTime is midnight, then daily auction will start immediately
        // after initial auction.
        if (initialAuctionEndTime == (initialAuctionEndTime / 1 days) * 1 days) {
            dailyAuctionStartTime = initialAuctionEndTime;
        } else {
            dailyAuctionStartTime = ((initialAuctionEndTime / 1 days) + 1) * 1 days;
        }
        lastPurchaseTick = 0;
        if (_minimumPrice > 0) {
            minimumPrice = _minimumPrice;
        }
        timeScale = _timeScale;
        if (_startingPrice > 0) {
            lastPurchasePrice = _startingPrice * 1 ether;
        } else {
            lastPurchasePrice = 2 ether;
        }
        for (uint i = 0; i < founders.length; i++) {
            TokenLocker tokenLocker = tokenLockers[founders[i]];
            tokenLocker.lockTokenLocker();
        }
        initialized = true;
        return true;
    }
}