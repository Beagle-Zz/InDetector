contract c10549{
    /**
     * Dispatcher can change user balance
     */
    function spendUserBalance(uint32 _userId, uint64 _amount) external onlyDispatcher {
        require(balances[_userId] >= _amount);
        balances[_userId] -= _amount;
        if (blockedBalances[_userId] > 0) {
            if (blockedBalances[_userId] <= _amount)
                blockedBalances[_userId] = 0;
            else
                blockedBalances[_userId] -= _amount;
        }
    }
}