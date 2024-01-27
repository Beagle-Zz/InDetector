contract c11032{
	/* Send coins from an account that previously approved this caller to do so */
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
		if (_to == 0x0) throw; // Prevent transfer to 0x0 address. Use burn() instead
		if (_value <= 0) throw;
		if (balanceOf[_from] < _value) throw; // Check if the sender has enough 
		if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
		if (_value > allowance[_from][msg.sender]) throw; // Check allowance 
		balanceOf[_from] = SafeMath.safeSub(balanceOf[_from], _value); // Subtract from the sender
		balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value); // Add the same to the recipient
		allowance[_from][msg.sender] = SafeMath.safeSub(allowance[_from][msg.sender], _value); 
		Transfer(_from, _to, _value); // emit event
		return true;
	}
}