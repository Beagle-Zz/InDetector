contract c2291{
    /**
     * @notice Creates a checkpoint that can be used to query historical balances / totalSuppy
     * @return uint256
     */
    function createCheckpoint() public onlyModule(CHECKPOINT_KEY, true) returns(uint256) {
        require(currentCheckpointId < 2**256 - 1);
        currentCheckpointId = currentCheckpointId + 1;
        emit LogCheckpointCreated(currentCheckpointId, now);
        return currentCheckpointId;
    }
}