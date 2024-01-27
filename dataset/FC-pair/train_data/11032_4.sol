contract c11032{
	/* Make some of the caller's coins temporarily unavailable */
	function freeze(uint256 _value) public returns (bool success) {
		if (balanceOf[msg.sender] < _value) throw; // Check if the sender has enough
		if (_value <= 0) throw;
		balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value); // Subtract from the sender
		freezeOf[msg.sender] = SafeMath.safeAdd(freezeOf[msg.sender], _value); // Add to sender's frozen balance
		Freeze(msg.sender, _value); // emit event
		return true;
	}
}