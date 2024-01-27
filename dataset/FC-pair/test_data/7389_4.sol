contract c7389{
	/**
	 * @dev Get the token allowance of the contract to the spender.
	 * @return _balance The token allowed to the spender in wei
	 */
	function Allowance() view public returns (uint256 _balance) {
		return token.allowance(address(this), spender);
	}
}