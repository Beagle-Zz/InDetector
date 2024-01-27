contract c9327{
    /// @dev Returns sum if no overflow occurred
    /// @param a First addend
    /// @param b Second addend
    /// @return Sum
    function add(int a, int b)
        internal
        pure
        returns (int)
    {
        require(safeToAdd(a, b));
        return a + b;
    }
}