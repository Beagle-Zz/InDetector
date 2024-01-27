contract c11068{
    /**
    * @dev called by the owner to pause, triggers stopped state
    */
    function pause() onlyAdmin whenNotPaused public {
        paused = true;
        emit Pause();
    }
}