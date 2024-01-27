contract c10856{
	// ------------------------------------------------------------------------
	// Allow an address to participate in the crowd sale up to some limit
	// ------------------------------------------------------------------------
	function crowdSaleApprove(address buyer, uint tokens) public onlyOwner returns (bool success) {
		require(tokens <= crowdSaleBalance);
		crowdSaleAllowed[buyer] = tokens;
		emit CrowdSaleApproval(msg.sender, buyer, tokens);
		return true;
	}
}