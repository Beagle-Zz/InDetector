contract c7554{
    /// @dev Returns difference if no overflow occurred
    /// @param a Minuend
    /// @param b Subtrahend
    /// @return Difference
    function sub(int a, int b)
        internal
        pure
        returns (int)
    {
        require(safeToSub(a, b));
        return a - b;
    }
}