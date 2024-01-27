contract c16950{
	// Function for token sell contract to call on transfers
	function transferFromTokenSell(address _to, address _from, uint256 _amount) external onlyTokenSale returns (bool success) {
		require(_amount > 0);
		require(_to != 0x0);
		require(balanceOf(_from) >= _amount);
		decrementBalance(_from, _amount);
		addToBalance(_to, _amount);
		Transfer(_from, _to, _amount);
		return true;
	}
}