contract c2501{
    /**
     * @notice Register the token symbol for its particular owner
     * @notice Once the token symbol is registered to its owner then no other issuer can claim
     * @notice its ownership. If the symbol expires and its issuer hasn't used it, then someone else can take it.
     * @param _symbol token symbol
     * @param _tokenName Name of the token
     * @param _owner Address of the owner of the token
     * @param _swarmHash Off-chain details of the issuer and token
     */
    function registerTicker(address _owner, string _symbol, string _tokenName, bytes32 _swarmHash) public whenNotPaused {
        require(_owner != address(0), "Owner should not be 0x");
        require(bytes(_symbol).length > 0 && bytes(_symbol).length <= 10, "Ticker length should always between 0 & 10");
        if(registrationFee > 0)
            require(ERC20(polyToken).transferFrom(msg.sender, this, registrationFee), "Failed transferFrom because of sufficent Allowance is not provided");
        string memory symbol = upper(_symbol);
        require(expiryCheck(symbol), "Ticker is already reserved");
        registeredSymbols[symbol] = SymbolDetails(_owner, now, _tokenName, _swarmHash, false);
        emit LogRegisterTicker (_owner, symbol, _tokenName, _swarmHash, now);
    }
}