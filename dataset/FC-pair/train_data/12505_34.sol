contract c12505{
    /**
	 * @dev get deposit contract address by using the default withdraw wallet
     *
     * @param _wallet the binded default withdraw wallet address
	 */
    function getDepositAddress(address _wallet) onlyOwner public view returns (address) {
        require(_wallet != address(0));
        address deposit = walletDeposits[_wallet];
        return deposit;
    }
}