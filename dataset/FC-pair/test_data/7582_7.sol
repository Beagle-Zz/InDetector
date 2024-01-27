contract c7582{
    /**
     * @return True iff the denominator of x/y is nonzero.
     */
    function divIsSafe(uint x, uint y)
        pure
        internal
        returns (bool)
    {
        return y != 0;
    }
}