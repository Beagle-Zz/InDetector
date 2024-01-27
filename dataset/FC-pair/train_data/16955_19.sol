contract c16955{
	// Add to balance
	function addToBalance(address _address, uint _amount) internal {
		balances[_address] = balances[_address].add(_amount);
	}
}