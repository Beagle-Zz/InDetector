contract c11308{
	// transfer _value tokens to _to from msg.sender
	function transfer(address _to, uint256 _value) public returns (bool) {
	    // if you want to destroy tokens, use burn replace transfer to address 0
		require(_to != address(0));
		// can not transfer to self
		require(_to != msg.sender);
		require(_value <= balances[msg.sender]);
		// SafeMath.sub will throw if there is not enough balance.
		balances[msg.sender] = balances[msg.sender].sub(_value);
		balances[_to] = balances[_to].add(_value);
		emit Transfer(msg.sender, _to, _value);
		return true;
	}
}