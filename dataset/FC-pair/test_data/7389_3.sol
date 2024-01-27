contract c7389{
	/**
	 * @dev Get the token balance of the contract.
	 * @return _balance The token balance of this contract in wei
	 */
	function Balance() view public returns (uint256 _balance) {
		return token.balanceOf(address(this));
	}
}