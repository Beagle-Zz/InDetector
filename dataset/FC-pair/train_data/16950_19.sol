contract c16950{
	// Get an address's TTT allowance
	function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}
}