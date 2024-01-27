contract c10144{
    /**
     * @return The result of multiplying x and y, throwing an exception in case of overflow.
     */
    function safeMul(uint x, uint y)
        pure
        internal
        returns (uint)
    {
        if (x == 0) {
            return 0;
        }
        uint p = x * y;
        require(p / x == y);
        return p;
    }
}