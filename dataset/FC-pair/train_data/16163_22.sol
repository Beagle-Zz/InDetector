contract c16163{
	/// @notice Set current ethAmount price in wei for one token
	/// @param ethAmountInWei - is the amount in wei for one token
	function setEthAmount(uint256 ethAmountInWei) isOwner {
		require(ethAmountInWei > 0);
		require(ethAmount != ethAmountInWei);
		ethAmount = ethAmountInWei;
		updatePrices();
	}
}