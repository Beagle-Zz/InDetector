contract c11046{
    /**
     * User can withdraw tokens manually in any time
     */
    function withdraw(uint64 _amount) external {
        uint32 userId = userIds[msg.sender];
        if (userId > 0) {
            require(balances[userId] - blockedBalances[userId] >= _amount);
            if (gameToken.transfer(msg.sender, _amount)) {
                balances[userId] -= _amount;
                emit Withdraw(msg.sender, _amount);
            }
        } else {
            require(walletBalances[msg.sender] >= _amount);
            if (gameToken.transfer(msg.sender, _amount)) {
                walletBalances[msg.sender] -= _amount;
                emit Withdraw(msg.sender, _amount);
            }
        }
    }
}