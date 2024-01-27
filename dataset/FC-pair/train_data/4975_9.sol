contract c4975{
    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() onlyOwner public {
        paused = true;
        emit Pause();
    }
}