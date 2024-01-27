contract c2874{
    /// @dev to be overridden in tests
    function getTime() internal view returns (uint) {
        return now;
    }
}