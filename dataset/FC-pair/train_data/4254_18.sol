contract c4254{
    /**
     * @dev Set paused to false.
     */
    function unpause() onlyOwner whenPaused public {
        paused = false;
        emit Unpause();
    }
}