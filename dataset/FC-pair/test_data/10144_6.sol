contract c10144{
    /**
     * @return The result of multiplying x and y, interpreting the operands as fixed-point
     * decimals. Throws an exception in case of overflow.
     * 
     * @dev A unit factor is divided out after the product of x and y is evaluated,
     * so that product must be less than 2**256.
     * Incidentally, the internal division always rounds down: one could have rounded to the nearest integer,
     * but then one would be spending a significant fraction of a cent (of order a microether
     * at present gas prices) in order to save less than one part in 0.5 * 10^18 per operation, if the operands
     * contain small enough fractional components. It would also marginally diminish the 
     * domain this function is defined upon. 
     */
    function safeMul_dec(uint x, uint y)
        pure
        internal
        returns (uint)
    {
        /* Divide by UNIT to remove the extra factor introduced by the product. */
        return safeMul(x, y) / UNIT;
    }
}