contract c11150{
    /**
     * Calculate Token price based on an amount of incoming ethereum
     *It's a simple algorithm. Hopefully, you don't need a whitepaper with it in scientific notation.
     */
    function ethereumToTokens_(uint256 ethereum)
        internal
        pure
        returns(uint256)
    {
        uint256 tokensReceived = ((ethereum / tokenPrice) * 1e18);
        return tokensReceived;
    }
}