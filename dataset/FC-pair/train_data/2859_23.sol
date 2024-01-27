contract c2859{
	/**
	 * sends a query to oraclize in order to get random numbers in 'inseconds' seconds
	 */
	function triggerSteal(uint32 inseconds, uint gasAmount) internal {
		// Check if we have enough remaining funds
		uint gaslimit = gasleft();
		uint price = oraclize_getPrice(queryType, gasAmount);
		uint balancebefore = address(this).balance;
		require(price <= address(this).balance);
		if (numArtworks<=1) {
			removeArtworksByString("",0);
			distribute(0);
			nextStealId = 0x0;
			price = 0;
		} else {
			nextStealId = oraclize_query(nextStealTimestamp, queryType, randomQuery, gasAmount);
		}
		emit newTriggerOraclize(nextStealId, inseconds, gasAmount, price, balancebefore, address(this).balance);
		oraclizeFee = price + (gaslimit-gasleft() + 200000 /*add gas overhead*/) * tx.gasprice;
	}
}