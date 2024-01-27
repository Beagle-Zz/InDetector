contract c7389{
	/**
	 * @dev Allows the owner to set up the allowance to the spender.
	 */
	function setUpAllowance() public onlyOwner {
		emit AllowanceChanged(token.allowance(address(this), spender), token.balanceOf(address(this)));
		token.approve(spender, token.balanceOf(address(this)));
	}
}