contract c18149{
    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function unpause() onlyOwner whenPaused {
        paused = false;
        Unpause();
    }
}