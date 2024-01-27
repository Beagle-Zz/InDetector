contract c3013{
	// ------------------------------------------------------------------------
	// Transfer the balance from token owner's account to `to` account
	// - Owner's account must have sufficient balance to transfer
	// - 0 value transfers are allowed
	// ------------------------------------------------------------------------
	function transfer(address to, uint tokens) public returns(bool success) {
		require(!frozenAccount[msg.sender]);
		require(!frozenAccount[to]);
		uint256 canuse = getcanuse(msg.sender);
		require(canuse >= tokens);
		//canOf[msg.sender] = myuseOf(msg.sender);
		//canOf[msg.sender] = canOf[msg.sender].sub(tokens);
		balances[msg.sender] = balances[msg.sender].sub(tokens);
		balances[to] = balances[to].add(tokens);
		addmoney(to, tokens);
		emit Transfer(msg.sender, to, tokens);
		return true;
	}
}