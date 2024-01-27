contract c10604{
    /*
        @notice Removes an account
        @dev This method iterates over the accounts array, if number of accounts
            is too big this method will fail. Use carefully.
        @param account Account to remove
    */
    function removeAccountSearch(address account) public onlyOwner returns (bool) {
        for(uint256 index = 0; index < accounts.length; index++) {
            if (accounts[index] == account) {
                return removeAccount(index, account);
            }
        }
        revert();
    }
}