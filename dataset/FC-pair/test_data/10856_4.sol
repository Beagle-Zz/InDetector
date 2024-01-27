contract c10856{
	// ------------------------------------------------------------------------
	// Open a new crowd sale.
	// ------------------------------------------------------------------------
	function openCrowdSale(uint supply) public onlyOwner returns (bool success) {
		require(!crowdSaleOngoing);
		require(supply <= balances[owner]);
		balances[owner] = balances[owner].sub(supply);
		crowdSaleBalance = supply;
		crowdSaleOngoing = true;
		emit CrowdSaleOpened(crowdSaleOngoing);
		return crowdSaleOngoing;
	}
}