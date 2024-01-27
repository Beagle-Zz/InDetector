contract c3457{
    /**
     * @dev check whether registered in lockAddress or not
     */
    modifier checkLock {
        require(!lockAddress[msg.sender]);
        _;
    }
}