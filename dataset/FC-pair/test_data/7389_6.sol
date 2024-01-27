contract c7389{
	/**
	 * @dev Allows the owner to update the allowance of the spender.
	 */
	function updateAllowance() public onlyOwner {
		uint256 balance = token.balanceOf(address(this));
		uint256 allowance = token.allowance(address(this), spender);
		uint256 difference = balance.sub(allowance);
		token.increaseApproval(spender, difference);
		emit AllowanceChanged(allowance, allowance.add(difference));
	}
}