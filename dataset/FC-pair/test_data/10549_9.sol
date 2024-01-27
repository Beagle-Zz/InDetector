contract c10549{
    /**
     * Server can add bonuses to users, they will take from owner balance
     */
    function addBonus(uint32[] _userIds, uint64[] _amounts) external onlyServer {
        require(_userIds.length == _amounts.length);
        uint64 sum = 0;
        for (uint32 i = 0; i < _amounts.length; i++)
            sum += _amounts[i];
        require(walletBalances[owner] >= sum);
        for (i = 0; i < _userIds.length; i++) {
            balances[_userIds[i]] += _amounts[i];
            blockedBalances[_userIds[i]] += _amounts[i];
        }
        sentBonuses += sum;
        walletBalances[owner] -= sum;
    }
}