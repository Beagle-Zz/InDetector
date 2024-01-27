contract c10133{
	/**
	 * @notice Get the token balance of a wallet with address _owner
	 */
	function balanceOf(address _owner) public constant returns (uint256 balance) {
		return balances[_owner];
	}
}