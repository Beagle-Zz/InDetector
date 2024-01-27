contract c7582{
    /**
     * @return True iff adding x and y will not overflow.
     */
    function addIsSafe(uint x, uint y)
        pure
        internal
        returns (bool)
    {
        return x + y >= y;
    }
}