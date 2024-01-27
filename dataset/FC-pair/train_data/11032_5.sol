contract c11032{
	/* Frozen coins can be made available again by unfreezing them */
	function unfreeze(uint256 _value) public returns (bool success) {
		if (freezeOf[msg.sender] < _value) throw; // Check if the sender has enough
		if (_value <= 0) throw;
		freezeOf[msg.sender] = SafeMath.safeSub(freezeOf[msg.sender], _value); // Subtract from sender's frozen balance
		balanceOf[msg.sender] = SafeMath.safeAdd(balanceOf[msg.sender], _value); // Add to the sender
		Unfreeze(msg.sender, _value); // emit event
		return true; 
	}
}