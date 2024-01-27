contract c10604{
    /*
        @notice Adds an account to the "hotwallet" group
        @param account Address of the account
    */
    function addAccount(address account) public onlyOwner returns (bool) {
        accounts.push(account);
        return true;
    }
}