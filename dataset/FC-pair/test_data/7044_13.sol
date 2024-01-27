contract c7044{
    /**
     * @dev Recalculate ICO state based on current block time.
     * Should be called periodically by ICO owner.
     */
    function touch() public {
        if (state != State.Active && state != State.Suspended) {
            return;
        }
        if (collectedWei >= hardCapWei) {
            state = State.Completed;
            endAt = block.timestamp;
            emit ICOCompleted(collectedWei);
        } else if (block.timestamp >= endAt) {
            if (collectedWei < lowCapWei) {
                state = State.NotCompleted;
                emit ICONotCompleted();
            } else {
                state = State.Completed;
                emit ICOCompleted(collectedWei);
            }
        }
    }
}