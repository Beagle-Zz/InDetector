contract c11863{
    /**
	 * @dev get the withdraw wallet addresses list binding to the deposit contract address
     *
     * @param _deposit the deposit contract address
     * @param _indices the array of indices of the withdraw wallets
	 */
    function getDepositWithdrawList(address _deposit, uint[] _indices) onlyOwner public view returns (bytes32[], address[]) {
        require(_indices.length != 0);
        bytes32[] memory names = new bytes32[](_indices.length);
        address[] memory wallets = new address[](_indices.length);
        for (uint i = 0; i < _indices.length; i = i.add(1)) {
            WithdrawWallet storage wallet = depositRepos[_deposit].withdrawWallets[_indices[i]];
            names[i] = wallet.name;
            wallets[i] = wallet.walletAddr;
        }
        return (names, wallets);
    }
}