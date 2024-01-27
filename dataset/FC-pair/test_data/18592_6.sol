contract c18592{
    /// @dev Buys tokens with Ether.
    function depositToken(uint256 _value) internal {
        uint256 tokenAlloc = buyPriceAt(getTime()) * _value;
        require(tokenAlloc != 0);
        ICOSupply = ICOSupply.add(tokenAlloc);
        require (ICOSupply <= ICOtotalSupply);
        mintTokens(msg.sender, tokenAlloc);
        forwardFunds();
    }
}