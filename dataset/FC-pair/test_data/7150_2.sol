contract c7150{
	// return _owner how many tokens
	function balanceOf(address _owner) public view returns (uint256 balance) {
		return balances[_owner];
	}
}