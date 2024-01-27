contract c18639{
    /// @notice This function is overrided by the test Mocks.
    function getTime() internal view returns (uint256) {
        return now;
    }
}