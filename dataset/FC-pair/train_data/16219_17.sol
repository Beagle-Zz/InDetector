contract c16219{
	/// @notice Set current ICO prices in wei for one metadollar
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
			priceUpdated(oldPrice, currentTokenPrice, "Metadollar price updated!");
		}
	}
}