contract c16389{
    /**
    * @dev add an address to the list of frozen accounts
    * @param account address to freeze
    * @return true if the address was added to the list of frozen accounts, false if the address was already in the list 
    */
    function freezeAccount(address account) public ifAuthorized(msg.sender, APHRODITE) returns (bool success) {
        if (!frozenAccounts[account]) {
            frozenAccounts[account] = true;
            emit Frozen(account);
            success = true; 
        }
    }
}