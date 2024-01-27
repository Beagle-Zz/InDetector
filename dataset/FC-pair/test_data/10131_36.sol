contract c10131{
	/**
	 * @notice Returns the amount which _spender is still allowed to withdraw from _owner
	 */
	function allowance(address _owner, address _spender) public constant returns (uint256 remaining) {
		return allowed[_owner][_spender];
	}
}