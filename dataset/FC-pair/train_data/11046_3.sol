contract c11046{
    /**
     * Register user
     */
    function registerUserWallet(address _user, uint32 _id) external onlyServer {
        require(userIds[_user] == 0);
        require(_user != owner);
        userIds[_user] = _id;
        if (walletBalances[_user] > 0) {
            balances[_id] += walletBalances[_user];
            walletBalances[_user] = 0;
        }
    }
}