contract c12428{
	/**
	 * @dev Configures controlled token params
	 */
	function configureTokenParams(
		string _name,
		string _symbol,
		uint _totalSupply
	) public onlyOwner returns (bool) {
		require(token != address(0));
		return token.setConfiguration(_name, _symbol, _totalSupply);
	}
}