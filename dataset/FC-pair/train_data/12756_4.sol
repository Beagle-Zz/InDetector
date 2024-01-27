contract c12756{
    /**
     * @dev called by the owner to lock, triggers locked state
     */
    function lock() public onlyOwner whenNotLocked {
        locked = true;
        emit Lock();
    }
}