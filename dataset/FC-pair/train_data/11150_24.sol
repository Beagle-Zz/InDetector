contract c11150{
    /**
     * Calculate token sell value.
     * It's a simple algorithm. Hopefully, you don't need a whitepaper with it in scientific notation.
     */
     function tokensToEthereum_(uint256 coin)
        internal
        pure
        returns(uint256)
    {
        uint256 ethReceived = tokenPrice * (SafeMath.div(coin, 1e18));
        return ethReceived;
    }
}