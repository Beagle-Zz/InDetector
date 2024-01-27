contract c7554{
    /// @dev Returns product if no overflow occurred
    /// @param a First factor
    /// @param b Second factor
    /// @return Product
    function mul(uint a, uint b)
        public
        pure
        returns (uint)
    {
        require(safeToMul(a, b));
        return a * b;
    }
}