contract c7581{
    /**
     * @return The result of dividing x by y, interpreting the operands as fixed point decimal numbers.
     * @dev Throws an exception in case of overflow or zero divisor; x must be less than 2^256 / UNIT.
     * Internal rounding is downward: a similar caveat holds as with safeDecMul().
     */
    function safeDiv_dec(uint x, uint y)
        pure
        internal
        returns (uint)
    {
        /* Reintroduce the UNIT factor that will be divided out by y. */
        return safeDiv(safeMul(x, UNIT), y);
    }
}