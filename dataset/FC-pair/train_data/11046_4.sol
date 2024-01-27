contract c11046{
    /**
     * Deposits tokens in game to some user
     */
    function sendTo(address _user, uint64 _amount) external {
        require(walletBalances[msg.sender] >= _amount);
        walletBalances[msg.sender] -= _amount;
        if (userIds[_user] > 0) {
            balances[userIds[_user]] += _amount;
        } else {
            walletBalances[_user] += _amount;
        }
        emit Deposit(_user, _amount);
    }
}