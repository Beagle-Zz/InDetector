contract c18618{
    /**
     * @dev remove an account from the frozen accounts list
     *
     * @param _ind the index of the account in the list
     */
    function removeAccount(uint _ind) internal returns (bool) {
        require(_ind < frozenAccounts.length);
        uint256 i = _ind;
        while (i < frozenAccounts.length.sub(1)) {
            frozenAccounts[i] = frozenAccounts[i.add(1)];
            i = i.add(1);
        }
        delete frozenAccounts[frozenAccounts.length.sub(1)];
        frozenAccounts.length = frozenAccounts.length.sub(1);
        return true;
    }
}