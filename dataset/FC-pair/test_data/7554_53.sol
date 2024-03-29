contract c7554{
    /// @dev Returns whether an add operation causes an overflow
    /// @param a First addend
    /// @param b Second addend
    /// @return Did no overflow occur?
    function safeToAdd(uint a, uint b)
        public
        pure
        returns (bool)
    {
        return a + b >= a;
    }
}