contract c3236{
	/*Function to check the amount of tokens that an owner allowed to a spender.*/
	function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
		return allowance[_owner][_spender];
	}
}