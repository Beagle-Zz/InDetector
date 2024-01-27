contract c7582{
    /**
     * @dev Convert an unsigned integer to a unsigned fixed-point decimal.
     * Throw an exception if the result would be out of range.
     */
    function intToDec(uint i)
        pure
        internal
        returns (uint)
    {
        return safeMul(i, UNIT);
    }
}