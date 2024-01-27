contract c9328{
    /// @dev Returns difference if no overflow occurred
    /// @param a Minuend
    /// @param b Subtrahend
    /// @return Difference
    function sub(uint a, uint b)
        internal
        pure
        returns (uint)
    {
        require(safeToSub(a, b));
        return a - b;
    }
}