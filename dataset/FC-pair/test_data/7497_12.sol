contract c7497{
    /// @dev Returns whether a subtraction operation causes an underflow
    /// @param a Minuend
    /// @param b Subtrahend
    /// @return Did no underflow occur?
    function safeToSub(uint a, uint b)
        internal
        pure
        returns (bool)
    {
        return a >= b;
    }
}