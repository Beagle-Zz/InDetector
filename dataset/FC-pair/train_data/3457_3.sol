contract c3457{
    /**
     * @dev add or remove in unlockAddress(whitelist)
     */
    function setUnlockAddress(address target, bool status)
    external
    isOwner
    {
        unlockAddress[target] = status;
        emit Unlocked(target, status);
    }
}