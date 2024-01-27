contract c1116{
    // ************************************************************************
    // called by the owner to pause, triggers stopped state
    // ************************************************************************
    function pause() public onlyOwner whenNotPaused {
        paused = true;
        emit Pause();
    }
}