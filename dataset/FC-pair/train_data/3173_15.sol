contract c3173{
    /**
     * @dev lock the tokens. If token is locked, cannot transfer
     */
    function lock() external onlyOwner {
        isLocked = true;
    }
}