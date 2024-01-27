contract c18021{
    /// @dev Deploy an ERC20 token contract, register it with TokenRegistry,
    ///      and returns the new token's address.
    /// @param name The name of the token
    /// @param symbol The symbol of the token.
    /// @param decimals The decimals of the token.
    /// @param totalSupply The total supply of the token.
    function createToken(
        string  name,
        string  symbol,
        uint8   decimals,
        uint    totalSupply
        )
        public
        returns (address addr)
    {
        require(tokenRegistry != 0x0);
        require(symbol.checkStringLength(3, 10));
        bytes10 symbolBytes = symbol.stringToBytes10();
        require(tokens[symbolBytes] == 0x0);
        ERC20Token token = new ERC20Token(
            name,
            symbol,
            decimals,
            totalSupply,
            tx.origin
        );
        addr = address(token);
        TokenRegistry(tokenRegistry).registerMintedToken(addr, symbol);
        tokens[symbolBytes] = addr;
        emit TokenCreated(
            addr,
            name,
            symbol,
            decimals,
            totalSupply,
            tx.origin
        );
    }
}