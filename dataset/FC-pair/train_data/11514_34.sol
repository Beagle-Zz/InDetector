contract c11514{
    /**
	 * @dev change the default withdraw wallet address binding to the deposit contract address
     *
     * @param _oldWallet the previous default withdraw wallet
     * @param _newWallet the new default withdraw wallet
	 */
    function changeDefaultWithdraw(address _oldWallet, address _newWallet) onlyOwner public returns (bool) {
        require(_newWallet != address(0));
        address deposit = walletDeposits[_oldWallet];
        DepositWithdraw deposWithdr = DepositWithdraw(deposit);
        require(deposWithdr.setWithdrawWallet(_newWallet));
        WithdrawWallet[] storage withdrawWalletList = depositRepos[deposit].withdrawWallets;
        withdrawWalletList[0].walletAddr = _newWallet;
        emit ChangeDefaultWallet(_oldWallet, _newWallet);
        return true;
    }
}