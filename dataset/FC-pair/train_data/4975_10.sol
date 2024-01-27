contract c4975{
    /**
     * @dev called by the owner to unpause, returns to normal state
     */
    function unpause() onlyOwner public {
        paused = false;
        emit Unpause();
    }
}