contract c7044{
    /**
     * @dev Terminate the ICO.
     * ICO goals are not reached, ICO terminated and cannot be resumed.
     */
    function terminate() public onlyOwner {
        require(state != State.Terminated &&
        state != State.NotCompleted &&
        state != State.Completed);
        state = State.Terminated;
        emit ICOTerminated();
    }
}