contract c12429{
	/**
	 * @dev Sets the token contract configuration
	 */
	function setConfiguration(
		string _name,
		string _symbol,
		uint _totalSupply
	) external onlyController returns (bool) {
		// not configured yet
		require(!isConfigured);
		// not empty name of the token
		require(bytes(_name).length > 0);
		// not empty ticker symbol of the token
		require(bytes(_symbol).length > 0);
		// pre-defined total supply
		require(_totalSupply > 0);
		name = _name;
		symbol = _symbol;
		totalSupply_ = _totalSupply.withDecimals(decimals);
		emit Configured(name, symbol, totalSupply_);
		isConfigured = true;
		return isConfigured;
	}
}