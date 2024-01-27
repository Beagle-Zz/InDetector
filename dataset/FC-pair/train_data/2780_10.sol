contract c2780{
    /**
     * @dev Unfreeze account, make transfers from this account available
     * @param _account Given account
     */
    function unfreeze(address _account) public onlyOwner {
        if (frozenAccounts[_account].frozen) {
            delete frozenAccounts[_account];
        }
    }
}