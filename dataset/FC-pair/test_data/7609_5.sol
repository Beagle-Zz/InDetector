contract c7609{
    /**
     * @dev called by the owner to resume, returns to normal state
     */
    function resume() onlyOwner whenPaused public {
        paused = false;
        emit Resume();
    }
}