contract c16950{
	// Finalize presale. If there are leftover TTT, overflow to crowdsale
	function finalizePresale() external onlyTokenSale returns (bool success) {
		require(presaleFinalized == false && privatesaleFinalized == true);
		uint256 amount = balanceOf(presaleAddress);
		if (amount != 0) {
			addToBalance(crowdsaleAddress, amount);
			decrementBalance(presaleAddress, amount);
		}
		presaleFinalized = true;
		PresaleFinalized(amount);
		return true;
	}
}