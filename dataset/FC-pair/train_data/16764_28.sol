contract c16764{
    /*
     * Disable transfering tokens more than allowed amount from certain account
     *
     * @param addr: Account to set allowed amount
     * @param amount: Amount of tokens to allow
     */
    function lockAccount(address addr, uint256 amount)
        external
        onlyOwner
        onlyValidDestination(addr)
    {
        require(amount > 0);
        lockedAccounts[addr] = amount;
    }
}