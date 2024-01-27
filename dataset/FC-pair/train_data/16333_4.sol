contract c16333{
	/// @notice Shows how much metadollars _spender can spend from _owner address
	function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}
}