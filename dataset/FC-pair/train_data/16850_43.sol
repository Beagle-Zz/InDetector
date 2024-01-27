contract c16850{
    /*
     * @dev in case of a failed refund or win send, user can check pending withdraw
     * @param address to check
     * @return pending withdraw amount
     */
    function userGetPendingTxByAddress(address addressToCheck) public constant returns (uint) {
        return userPendingWithdrawals[addressToCheck];
    }
}