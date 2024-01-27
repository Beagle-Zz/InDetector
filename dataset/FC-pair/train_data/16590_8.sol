contract c16590{
    // Called by the owner on emergency, triggers paused state
    function pause() external onlyOwner ifNotPaused {
        paused = true;
    }
}