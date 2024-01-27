contract c18146{
  // Function that is called when a user or another contract wants to transfer funds .
	function transfer(address _to, uint256 _value, bytes _data, string _custom_fallback) public returns (bool success) {
		require(_to != address(0));
        require(_to != address(this));
		require(_value <= balances[msg.sender]);
		// SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
		if( isContract(_to) ) {
			_to.call.value(0)(bytes4(keccak256(_custom_fallback)), msg.sender, _value, _data);
		} 
		Transfer(msg.sender, _to, _value, _data);
		return true;
	}
}