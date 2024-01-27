contract c16993{
	/* Send coins */
	function transfer(address _to, uint256 _value) public returns (bool) {
		require(_to != address(0));
    	require(balances[msg.sender] >=_value);
		require(balances[msg.sender] >= _value);
		require(balances[_to] + _value >= balances[_to]);
		balances[msg.sender] -= _value;					 
		balances[_to] += _value;					
		emit Transfer(msg.sender, _to, _value);				  
		return true;
	}
}