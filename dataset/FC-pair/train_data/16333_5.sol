contract c16333{
	/// @notice Calculates amount of weis needed to buy more than one metadollar
	/// @param howManyTokenToBuy - Amount of metadollars to calculate
	function calculateTheEndPrice(uint256 howManyTokenToBuy) constant returns (uint256 summarizedPriceInWeis) {
		if(howManyTokenToBuy > 0) {
			summarizedPriceInWeis = howManyTokenToBuy * currentTokenPrice;
		}else {
			summarizedPriceInWeis = 0;
		}
	}
}