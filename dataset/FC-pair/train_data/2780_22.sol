contract c2780{
    /**
     * @dev Returns current manager
     */
    function getManager() public view onlyOwnerOrManager returns (address) {
        return manager;
    }
}