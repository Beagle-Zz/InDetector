contract c2755{
    /**
     * @dev Pauses the token contract.
     */
    function pause() onlyOwner whenNotPaused public {
        paused = true;
        emit Pause();
    }
}