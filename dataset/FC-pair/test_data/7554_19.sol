contract c7554{
    /// @dev Returns whether a multiply operation causes an overflow
    /// @param a First factor
    /// @param b Second factor
    /// @return Did no overflow occur?
    function safeToMul(int a, int b)
        internal
        pure
        returns (bool)
    {
        return (b == 0) || (a * b / b == a);
    }
}