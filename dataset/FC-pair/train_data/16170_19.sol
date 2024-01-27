contract c16170{
	/// @notice Set current ICO price in wei for one token
	/// @param priceForIcoInWei - is the amount in wei for one token
	function setICOPrice(uint256 priceForIcoInWei) isOwner {
		require(priceForIcoInWei > 0);
		require(ICOprice != priceForIcoInWei);
		ICOprice = priceForIcoInWei;
		updatePrices();
	}
}