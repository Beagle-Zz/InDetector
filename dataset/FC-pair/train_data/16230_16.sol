contract c16230{
	/// @notice Set current ICO prices in wei for one token
	function updatePrices() internal {
		uint256 oldPrice = currentTokenPrice;
		if(preIcoIsRunning) {
			checkPreIcoStatus();
		}
		if(preIcoIsRunning) {
			currentTokenPrice = preICOprice;
		}else{
			currentTokenPrice = ICOprice;
		}
		if(oldPrice != currentTokenPrice) {
			priceUpdated(oldPrice, currentTokenPrice, "Token price updated!");
		}
	}
}