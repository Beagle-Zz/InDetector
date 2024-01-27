contract c13185{
    /**
     * @dev called by the owner to locke, triggers locked state
     */
    function lock() public onlyOwner whenNotLocked {
        locked = true;
        emit Lock();
    }
}