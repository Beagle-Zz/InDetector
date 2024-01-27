contract c12588{
    /**
     * @dev called by the admin to unpause, returns to normal state
     */
    function unpause() public onlyAdmin whenPaused returns(bool) {
        paused = false;
        return true;
    }
}