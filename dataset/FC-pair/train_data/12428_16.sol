contract c12428{
	/**
	 * @dev Sets controlled token
	 */
	function setToken (
		address _token
	) public onlyOwner returns (bool) {
		require(token == address(0));
		require(_token.isContract());
		token = UKTTokenBasic(_token);
		return true;
	}
}