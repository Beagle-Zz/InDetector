contract c12143{
	/**
	 * @dev Function that validates if the purchase is valid by verifying the parameters
	 *
	 * @param value Amount of ethers sent
	 * @param amount Total number of tokens user is trying to buy.
	 *
	 * @return checks various conditions and returns the bool result indicating validity.
	 */
	function isValidPurchase(uint256 value, uint256 amount) internal constant returns (bool) {
		// check if timestamp is falling in the range
		bool validTimestamp = startingTimestamp <= block.timestamp && endingTimestamp >= block.timestamp;
		// check if value of the ether is valid
		bool validValue = value != 0;
		// check if rate of the token is clearly defined
		bool validRate = tokenPriceInEth > 0;
		// check if the tokens available in contract for sale
		bool validAmount = tokensForSale.sub(totalTokenSold) >= amount && amount > 0;
		// validate if all conditions are met
		return validTimestamp && validValue && validRate && validAmount && !isClose;
	}
}