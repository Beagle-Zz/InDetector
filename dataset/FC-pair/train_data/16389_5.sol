contract c16389{
    /// @dev called by an authorized msg.sender to pause, triggers stopped state
    /// Multiple addresses may be authorized to call this method
    function pause() public whenNotPaused ifAuthorized(msg.sender, CUPID) returns (bool) {
        emit Pause();
        paused = true;
        return true;
    }
}