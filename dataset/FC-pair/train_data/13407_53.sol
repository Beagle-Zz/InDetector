contract c13407{
    /// @notice Skip Initialization and minting if we're not the OG Metronome
    /// @param _token MET token contract address
    /// @param _proceeds Address of Proceeds contract
    /// @param _genesisTime The block.timestamp when first auction started on OG chain
    /// @param _minimumPrice Nobody can buy tokens for less than this price
    /// @param _startingPrice Start price of MET when first auction starts
    /// @param _timeScale time scale factor for auction. will be always 1 in live environment
    /// @param _chain chain where this contract is being deployed
    /// @param _initialAuctionEndTime  Initial Auction end time in ETH chain. 
    function skipInitBecauseIAmNotOg(address _token, address _proceeds, uint _genesisTime, 
        uint _minimumPrice, uint _startingPrice, uint _timeScale, bytes8 _chain, 
        uint _initialAuctionEndTime) public onlyOwner returns (bool) {
        require(!minted);
        require(!initialized);
        require(_timeScale != 0);
        require(address(token) == 0x0 && _token != 0x0);
        require(address(proceeds) == 0x0 && _proceeds != 0x0);
        initPricer();
        // minting substitute section
        token = METToken(_token);
        proceeds = Proceeds(_proceeds);
        INITIAL_FOUNDER_SUPPLY = 0;
        INITIAL_AC_SUPPLY = 0;
        mintable = 0;  // 
        // initial auction substitute section
        genesisTime = _genesisTime;
        initialAuctionEndTime = _initialAuctionEndTime;
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
        chain = _chain;
        minted = true;
        initialized = true;
        return true;
    }
}