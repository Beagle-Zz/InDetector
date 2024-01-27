contract c2479{
    /**
     * @notice store the changes to the checkpoint objects
     * @param _checkpoints the affected checkpoint object array
     * @param _newValue the new value that needs to be stored
     */
    function adjustCheckpoints(Checkpoint[] storage _checkpoints, uint256 _newValue) internal {
        //No checkpoints set yet
        if (currentCheckpointId == 0) {
            return;
        }
        //No previous checkpoint data - add current balance against checkpoint
        if (_checkpoints.length == 0) {
            _checkpoints.push(
                Checkpoint({
                    checkpointId: currentCheckpointId,
                    value: _newValue
                })
            );
            return;
        }
        //No new checkpoints since last update
        if (_checkpoints[_checkpoints.length - 1].checkpointId == currentCheckpointId) {
            return;
        }
        //New checkpoint, so record balance
        _checkpoints.push(
            Checkpoint({
                checkpointId: currentCheckpointId,
                value: _newValue
            })
        );
    }
}