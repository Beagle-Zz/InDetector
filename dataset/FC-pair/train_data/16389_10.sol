contract c16389{
    /**
    * @dev check if an account is frozen
    * @param account address to check
    * @return true iff the address is in the list of frozen accounts and hasn't been unfrozen
    */
    function isFrozen(address account) public view returns (bool) {
        return frozenAccounts[account];
    }
}