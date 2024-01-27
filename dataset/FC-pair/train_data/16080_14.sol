contract c16080{
	/// @notice Processing each buying
	function buyToken() internal {
		uint256 value = msg.value;
		address sender = msg.sender;
		require(!icoIsClosed);
		require(!frozenAccount[sender]);
		require(value > 0);
		require(currentTokenPrice > 0);
		uint256 amount = value / currentTokenPrice;			// calculates amount of tokens
		uint256 moneyBack = value - (amount * sellPrice);
		require(tokenBalanceOf[this] >= amount);              		// checks if contract has enough to sell
		amountOfInvestments = amountOfInvestments + (value - moneyBack);
		updatePrices();
		_transfer(this, sender, amount);
		if(moneyBack > 0) {
			sender.transfer(moneyBack);
		}
	}
}