contract c18992{
	// don't allow transfers before the required wait-time
	// and don't allow transfers to this contract addr, it'll just kill tokens
	function transfer(address _to, uint256 _value) public returns (bool success){
		require(balances[msg.sender] >= _value 
			&& contributionTime[msg.sender] + WAITTIMEUNTILWITHDRAWORTRANSFER <= block.timestamp
			&& _to != address(this)
			&& _to != address(0));
		// safely subtract
		balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);
		balances[_to] = SafeMath.add(balances[_to], _value);
		// log event 
		emit Transfer(msg.sender, _to, _value);
		return true;
	}
}