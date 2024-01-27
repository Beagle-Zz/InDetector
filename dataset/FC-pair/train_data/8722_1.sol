contract c8722{
	/* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint _value) public canTransfer returns (bool success) {
        uint allowance = allowed[_from][msg.sender];
		require(_to != address(0));// Prevent transfer to 0x0 address.
		require(_value > 0);
		require(balances[_from] >= _value); // Check if the sender has enough
		require(allowance >= _value); // Check allowance
        require(balances[_to] + _value >= balances[_to]); // Check for overflows     
        balances[_from] = balances[_from].sub(_value);      // Subtract from the sender
        balances[_to] = balances[_to].add(_value);          // Add the same to the recipient
		if (allowance < MAX_UINT256) {
			allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
		}
        emit Transfer(_from, _to, _value);
        return true;
    }
}