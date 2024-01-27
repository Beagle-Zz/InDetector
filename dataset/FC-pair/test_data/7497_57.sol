contract c7497{
    /// @dev Returns difference if no overflow occurred
    /// @param a Minuend
    /// @param b Subtrahend
    /// @return Difference
    function sub(uint a, uint b)
        public
        pure
        returns (uint)
    {
        require(safeToSub(a, b));
        return a - b;
    }
}