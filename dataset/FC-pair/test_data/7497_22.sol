contract c7497{
    /// @dev Returns product if no overflow occurred
    /// @param a First factor
    /// @param b Second factor
    /// @return Product
    function mul(int a, int b)
        internal
        pure
        returns (int)
    {
        require(safeToMul(a, b));
        return a * b;
    }
}