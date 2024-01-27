contract c7497{
    /// @dev Constructor-Function creates exchange
    /// @param _frtToken - address of frtToken ERC-20 token
    /// @param _owlToken - address of owlToken ERC-20 token
    /// @param _auctioneer - auctioneer for managing interfaces
    /// @param _ethToken - address of ETH ERC-20 token
    /// @param _ethUSDOracle - address of the oracle contract for fetching feeds
    /// @param _thresholdNewTokenPair - Minimum required sell funding for adding a new token pair, in USD
    function setupDutchExchange(
        TokenFRT _frtToken,
        TokenOWL _owlToken,
        address _auctioneer, 
        address _ethToken,
        PriceOracleInterface _ethUSDOracle,
        uint _thresholdNewTokenPair,
        uint _thresholdNewAuction
    )
        public
    {
        // Make sure contract hasn't been initialised
        require(ethToken == 0);
        // Validates inputs
        require(address(_owlToken) != address(0));
        require(address(_frtToken) != address(0));
        require(_auctioneer != 0);
        require(_ethToken != 0);
        require(address(_ethUSDOracle) != address(0));
        frtToken = _frtToken;
        owlToken = _owlToken;
        auctioneer = _auctioneer;
        ethToken = _ethToken;
        ethUSDOracle = _ethUSDOracle;
        thresholdNewTokenPair = _thresholdNewTokenPair;
        thresholdNewAuction = _thresholdNewAuction;
    }
}