contract c2479{
    /**
     * @notice Creates a new Security Token and saves it to the registry
     * @param _name Name of the token
     * @param _symbol Ticker symbol of the security token
     * @param _tokenDetails off-chain details of the token
     * @param _divisible Set to true if token is divisible
     */
    function generateSecurityToken(string _name, string _symbol, string _tokenDetails, bool _divisible) public whenNotPaused {
        require(bytes(_name).length > 0 && bytes(_symbol).length > 0, "Name and Symbol string length should be greater than 0");
        require(ITickerRegistry(tickerRegistry).checkValidity(_symbol, msg.sender, _name), "Trying to use non-valid symbol");
        if(registrationFee > 0)
            require(ERC20(polyToken).transferFrom(msg.sender, this, registrationFee), "Failed transferFrom because of sufficent Allowance is not provided");
        string memory symbol = upper(_symbol);
        address newSecurityTokenAddress = ISTProxy(protocolVersionST[protocolVersion]).deployToken(
            _name,
            symbol,
            18,
            _tokenDetails,
            msg.sender,
            _divisible,
            polymathRegistry
        );
        securityTokens[newSecurityTokenAddress] = SecurityTokenData(symbol, _tokenDetails);
        symbols[symbol] = newSecurityTokenAddress;
        emit LogNewSecurityToken(symbol, newSecurityTokenAddress, msg.sender);
    }
}