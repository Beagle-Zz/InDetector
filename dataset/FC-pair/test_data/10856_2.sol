contract c10856{
	// ------------------------------------------------------------------------
	// Increase total supply ("issue" new tokens)
	// ------------------------------------------------------------------------
	function increaseTotalSupply(uint tokens) public onlyOwner returns (bool success) {
		require(!supplyLocked);
		_totalSupply = _totalSupply.add(tokens);
		balances[owner] = balances[owner].add(tokens);
		emit Transfer(address(0), owner, tokens);
		return true;
	}
}