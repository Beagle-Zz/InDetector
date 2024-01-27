contract c8721{
    /* Send coins */
    function transfer(address _to, uint _value) public canTransfer returns (bool success) {
		require(_to != address(0));// Prevent transfer to 0x0 address.
		require(_value > 0);
        require(balances[msg.sender] >= _value); // Check if the sender has enough
        require(balances[_to] + _value >= balances[_to]); // Check for overflows
		balances[msg.sender] = balances[msg.sender].sub(_value); // Subtract from the sender
        balances[_to] = balances[_to].add(_value);  // Add the same to the recipient
        emit Transfer(msg.sender, _to, _value);   // Notify anyone listening that this transfer took place
		return true;
    }
}