contract c11514{
    /**
	 * @dev create deposit contract address for the default withdraw wallet
     *
     * @param _wallet the binded default withdraw wallet address
	 */
    function createDepositContract(address _wallet) onlyOwner public returns (address) {
        require(_wallet != address(0));
        DepositWithdraw deposWithdr = new DepositWithdraw(_wallet); // new contract for deposit
        address _deposit = address(deposWithdr);
        walletDeposits[_wallet] = _deposit;
        WithdrawWallet[] storage withdrawWalletList = depositRepos[_deposit].withdrawWallets;
        withdrawWalletList.push(WithdrawWallet("default wallet", _wallet));
        // depositRepos[_deposit].balance = 0;
        depositRepos[_deposit].frozen = 0;
        emit CreateDepositAddress(_wallet, address(deposWithdr));
        return deposWithdr;
    }
}