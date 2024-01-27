contract c2479{
    /**
     * @notice Add a new custom (Token should follow the ISecurityToken interface) Security Token and saves it to the registry
     * @param _name Name of the token
     * @param _symbol Ticker symbol of the security token
     * @param _owner Owner of the token
     * @param _securityToken Address of the securityToken
     * @param _tokenDetails off-chain details of the token
     * @param _swarmHash off-chain details about the issuer company
     */
    function addCustomSecurityToken(string _name, string _symbol, address _owner, address _securityToken, string _tokenDetails, bytes32 _swarmHash) public onlyOwner whenNotPaused {
        require(bytes(_name).length > 0 && bytes(_symbol).length > 0, "Name and Symbol string length should be greater than 0");
        string memory symbol = upper(_symbol);
        require(_securityToken != address(0) && symbols[symbol] == address(0), "Symbol is already at the polymath network or entered security token address is 0x");
        require(_owner != address(0));
        require(!(ITickerRegistry(tickerRegistry).isReserved(symbol, _owner, _name, _swarmHash)), "Trying to use non-valid symbol");
        symbols[symbol] = _securityToken;
        securityTokens[_securityToken] = SecurityTokenData(symbol, _tokenDetails);
        emit LogAddCustomSecurityToken(_name, symbol, _securityToken, now);
    }
}