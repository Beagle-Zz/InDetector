contract c13331{
    /**
     * @dev called by the owner to pause, triggers stopped state
     */
    function setPause(bool mode)  public {
        require(rightAndRoles.onlyRoles(msg.sender,1));
        if (!paused && mode) {
            paused = true;
            emit Pause();
        }else
        if (paused && !mode) {
            paused = false;
            emit Unpause();
        }
    }
}