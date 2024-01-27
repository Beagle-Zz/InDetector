contract c18990{
	// don't allow transfers before the required wait-time
	// and don't allow transfers to the contract addr, it'll just kill tokens
	function transferFrom(address _from, address _to, uint _value) public returns(bool){
		require(allowed[_from][msg.sender] >= _value 
			&& balances[_from] >= _value 
			&& contributionTime[_from] + WAITTIMEUNTILWITHDRAWORTRANSFER <= block.timestamp
			&& _to != address(this)
			&& _to != address(0));
		// safely add to _to and subtract from _from, and subtract from allowed balances.
		balances[_to] = SafeMath.add(balances[_to], _value);
   		balances[_from] = SafeMath.sub(balances[_from], _value);
  		allowed[_from][msg.sender] = SafeMath.sub(allowed[_from][msg.sender], _value);
  		// log event
		emit Transfer(_from, _to, _value);
		return true;
	}
}