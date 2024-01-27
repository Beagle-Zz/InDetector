contract c11863{
    /**
	 * @dev check if the wallet name is not matching the expected wallet address
     *
     * @param _deposit the deposit address
     * @param _name the withdraw wallet name
     * @param _to the withdraw wallet address
	 */
    function checkWithdrawAddress(address _deposit, bytes32 _name, address _to) public view returns (bool, bool) {
        uint len = depositRepos[_deposit].withdrawWallets.length;
        for (uint i = 0; i < len; i = i.add(1)) {
            WithdrawWallet storage wallet = depositRepos[_deposit].withdrawWallets[i];
            if (_name == wallet.name) {
                return(true, (_to == wallet.walletAddr));
            }
        }
        return (false, true);
    }
}