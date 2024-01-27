contract c16764{
    /*
     * Enable transfering tokens of locked account
     *
     * @param addr: Account to unlock
     */
    function unlockAccount(address addr)
        external
        onlyOwner
        onlyValidDestination(addr)
    {
        lockedAccounts[addr] = 0;
    }
}