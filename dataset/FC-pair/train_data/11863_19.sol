contract c11863{
    /**
	 * @dev set the default wallet address
	 * @param _wallet the default wallet address binded to this deposit contract
	 */
    function setWithdrawWallet(address _wallet) onlyOwner public returns (bool) {
        require(_wallet != address(0));
        wallet = _wallet;
        return true;
    }
}