contract c11898{
	// Transfer the balance from owner's account to another account
	function transferTokens(address to_address, uint256 tokens) private returns(bool success)
	{
		require(to_address != 0x0);
		require(balances[address(this)] >= tokens && tokens > 0);
		balances[address(this)] = (balances[address(this)]).sub(tokens);
		balances[to_address] = (balances[to_address]).add(tokens);
		emit   Transfer(address(this), to_address, tokens);
		return true;
	}
}