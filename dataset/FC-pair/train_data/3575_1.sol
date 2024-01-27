contract c3575{
    /**
     * @dev Add new account with locked token balance to the specified group id.
     *
     * @param _id Group identifying number.
     * @param _account The address of the account to be added.
     * @param _balance The number of tokens to be locked.
     */
    function add(uint8 _id, address _account, uint _balance) internal {
        Group storage group = groups[_id];
        group.balances[_account] = group.balances[_account].plus(_balance);
        group.remaining = group.remaining.plus(_balance);
    }
}