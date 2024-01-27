contract c7497{
    /// @dev Returns sum if no overflow occurred
    /// @param a First addend
    /// @param b Second addend
    /// @return Sum
    function add(uint a, uint b)
        internal
        pure
        returns (uint)
    {
        require(safeToAdd(a, b));
        return a + b;
    }
}