contract c2883{
    /// @dev to be overridden in tests
    function getTime() internal view returns (uint) {
        return now;
    }
}