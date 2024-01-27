contract c16389{
    /// @dev called by an authorized msg.sender to unpause, returns to normal state
    /// Multiple addresses may be authorized to call this method
    function unpause() public whenPaused ifAuthorized(msg.sender, CUPID) returns (bool) {
        emit Unpause();
        paused = false;
        return true;
    }
}