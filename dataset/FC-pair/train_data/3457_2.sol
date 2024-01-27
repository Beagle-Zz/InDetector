contract c3457{
    /**
     * @dev add or remove in lockAddress(blacklist)
     */
    function setLockAddress(address target, bool status)
    external
    isOwner
    {
        require(owner != target);
        lockAddress[target] = status;
        emit Locked(target, status);
    }
}