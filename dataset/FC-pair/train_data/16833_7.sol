contract c16833{
    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function pause() onlyOwner whenNotPaused public {
        require(msg.sender != address(0));
        paused = true;
        Pause();
    }
}