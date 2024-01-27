contract c10604{
    /*
        @notice Removes an account without searching for the index.
        @param index Index of the account, must match the account index.
        @param account Account to remove
    */
    function removeAccount(uint256 index, address account) public onlyOwner returns (bool) {
        require(accounts[index] == account);
        accounts[index] = accounts[accounts.length - 1];
        accounts.length -= 1;
        return true;
    }
}