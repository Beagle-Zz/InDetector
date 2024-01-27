contract c10825{
    // destroy his tokens
	function burn(uint256 _value) public {
		require(_value <= balances[msg.sender]);
		address burner = msg.sender;
		balances[burner] = balances[burner].sub(_value);
		totalSupply_ = totalSupply_.sub(_value);
		emit Burn(burner, _value);
		// add a Transfer event only to ensure Transfer event record integrity
		emit Transfer(burner, address(0), _value);
	}
}