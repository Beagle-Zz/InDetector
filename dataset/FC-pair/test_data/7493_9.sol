contract c7493{
    /// @dev Returns product if no overflow occurred
    /// @param a First factor
    /// @param b Second factor
    /// @return Product
    function mul(uint a, uint b)
        internal
        pure
        returns (uint)
    {
        require(safeToMul(a, b));
        return a * b;
    }
}