contract c10856{
	// ------------------------------------------------------------------------
	// End crowd sale. Increments crowdSalesCompleted counter.
	// Returns remaining crowdSaleBalance to owner.
	// ------------------------------------------------------------------------
	function lockCrowdSale() public onlyOwner returns (bool success) {
		require(crowdSaleOngoing);
		crowdSaleOngoing = false;
		crowdSalesCompleted = crowdSalesCompleted.add(1);
		balances[owner] = balances[owner].add(crowdSaleBalance);
		crowdSaleBalance = 0;
		emit CrowdSaleLocked(!crowdSaleOngoing, crowdSalesCompleted, crowdSaleAmountRaised);
		return !crowdSaleOngoing;
	}
}