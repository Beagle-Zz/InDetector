contract c18149{
    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() onlyOwner whenNotPaused {
        paused = true;
        Pause();
    }
}