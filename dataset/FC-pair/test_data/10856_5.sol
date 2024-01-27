contract c10856{
	// ------------------------------------------------------------------------
	// Add amount owed (usually from broker to user)
	// Amount can only be increased, and can only be decreased by paying.
	// ------------------------------------------------------------------------
	function addOwed(address to, uint tokens) public returns (uint newOwed) {
		require((msg.sender == owner) || (crowdSalesCompleted > 0));
		owed[msg.sender][to] = owed[msg.sender][to].add(tokens);
		emit AddOwed(msg.sender, to, tokens);
		return owed[msg.sender][to];
	}
}