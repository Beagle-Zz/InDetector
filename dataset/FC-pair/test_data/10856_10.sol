contract c10856{
	// ------------------------------------------------------------------------
	// Change ETH cost of token (goal is to keep it pegged to 0.10 USD)
	// Cost must be specified in Wei
	// ------------------------------------------------------------------------
	function changeWeiCostOfToken(uint newCost) public onlyOwners returns (uint changedCost) {
		require(crowdSaleOngoing);
		require(newCost > 0);
		weiCostOfToken = newCost * 1 wei;
		emit ChangedWeiCostOfToken(newCost);
		return weiCostOfToken;
	}
}