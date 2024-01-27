contract c7497{
    /// @dev Returns whether an add operation causes an overflow
    /// @param a First addend
    /// @param b Second addend
    /// @return Did no overflow occur?
    function safeToAdd(int a, int b)
        internal
        pure
        returns (bool)
    {
        return (b >= 0 && a + b >= a) || (b < 0 && a + b < a);
    }
}