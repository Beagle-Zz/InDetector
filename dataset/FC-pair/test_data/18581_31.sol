contract c18581{
    //////////
    // Testing specific methods
    //////////
    /// @notice This function is overridden by the test Mocks.
    function getBlockNumber() internal view returns (uint256) {
        return block.number;
    }
}