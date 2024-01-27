contract c16163{
	/// @notice Set both ethAmount and mtdAmount at the same time
	/// @param mtdAmountInWei - is the amount in wei for one token
	/// @param ethAmountInWei - is the amount in wei for one token
	function setAmounts(uint256 mtdAmountInWei, uint256 ethAmountInWei) isOwner {
		require(mtdAmountInWei > 0);
		require(ethAmountInWei > 0);
		mtdAmount = mtdAmountInWei;
		ethAmount = ethAmountInWei;
		updatePrices();
	}
}