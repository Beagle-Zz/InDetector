contract c10769{
    /**
	 * @dev withdraw the tokens from the deposit address to default wallet with charge fee
     *
     * @param _deposit the deposit address
     * @param _time the timestamp the withdraw occurs
     * @param _value the amount of tokens need to be frozen
	 */
    function withdrawWithFee(address _deposit, uint256 _time, uint256 _value, bool _check) onlyOwner public returns (bool) {    
        WithdrawWallet[] storage withdrawWalletList = depositRepos[_deposit].withdrawWallets;
        return withdrawWithFee(_deposit, _time, withdrawWalletList[0].name, withdrawWalletList[0].walletAddr, _value, _check);
    }
}