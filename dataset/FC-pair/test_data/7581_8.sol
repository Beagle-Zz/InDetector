contract c7581{
    /**
     * @return The result of dividing x by y, throwing an exception if the divisor is zero.
     */
    function safeDiv(uint x, uint y)
        pure
        internal
        returns (uint)
    {
        /* Although a 0 denominator already throws an exception,
         * it is equivalent to a THROW operation, which consumes all gas.
         * A require statement emits REVERT instead, which remits remaining gas. */
        require(y != 0);
        return x / y;
    }
}