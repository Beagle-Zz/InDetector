contract c7497{
    /// @dev Returns whether a subtraction operation causes an underflow
    /// @param a Minuend
    /// @param b Subtrahend
    /// @return Did no underflow occur?
    function safeToSub(int a, int b)
        internal
        pure
        returns (bool)
    {
        return (b >= 0 && a - b <= a) || (b < 0 && a - b > a);
    }
}