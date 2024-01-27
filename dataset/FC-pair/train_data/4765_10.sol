contract c4765{
    /**
    * @dev called by the owner to pause, triggers stopped state
    */
    function pause() onlyGovernor whenNotPaused public {
        paused = true;
        emit Pause();
    }
}