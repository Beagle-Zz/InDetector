contract c10131{
	/**
	 * @notice Get the token balance of a wallet with address _owner
	 */
	function balanceOf(address _owner) public constant returns (uint256 balance) {
		return balances[_owner];
	}
}