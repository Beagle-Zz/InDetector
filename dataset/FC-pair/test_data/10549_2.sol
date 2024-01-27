contract c10549{
    /**
     * Deposits from user
     */
    function tokenFallback(address _from, uint256 _amount, bytes _data) public {
        if (userIds[_from] > 0) {
            balances[userIds[_from]] += uint64(_amount);
        } else {
            walletBalances[_from] += uint64(_amount);
        }
        emit Deposit(_from, uint64(_amount));
    }
}