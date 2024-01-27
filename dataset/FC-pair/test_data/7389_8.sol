contract c7389{
	/**
	 * @dev Allows the owner to change the spender.
	 * @param _spender The new spender address
	 */
	function changeSpender(address _spender) public onlyOwner {
		require(_spender != address(0));
		emit SpenderChanged(spender, _spender);
		token.approve(spender, 0);
		spender = _spender;
		setUpAllowance();
	}
}