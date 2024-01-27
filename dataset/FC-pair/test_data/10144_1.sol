contract c10144{
    /**
     * @return The result of adding x and y, throwing an exception in case of overflow.
     */
    function safeAdd(uint x, uint y)
        pure
        internal
        returns (uint)
    {
        require(x + y >= y);
        return x + y;
    }
}