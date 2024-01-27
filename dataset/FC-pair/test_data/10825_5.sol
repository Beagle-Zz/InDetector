contract c10825{
    // return how many tokens _owner approve to _spender
	function allowance(address _owner, address _spender) public view returns (uint256) {
		return allowed[_owner][_spender];
	}
}