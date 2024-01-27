contract c12505{
    /**
	 * @dev get the number of withdraw wallet addresses bindig to the deposit contract address
     *
     * @param _deposit the deposit contract address
	 */
    function getDepositWithdrawCount(address _deposit) onlyOwner public view returns (uint) {
        require(_deposit != address(0));
        WithdrawWallet[] storage withdrawWalletList = depositRepos[_deposit].withdrawWallets;
        uint len = withdrawWalletList.length;
        return len;
    }
}