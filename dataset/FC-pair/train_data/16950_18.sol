contract c16950{
	// Approve another address a certain amount of TTT
	function approve(address _spender, uint256 _value) public returns (bool success) {
		require((_value == 0) || (allowance(msg.sender, _spender) == 0));
		allowed[msg.sender][_spender] = _value;
		Approval(msg.sender, _spender, _value);
		return true;
	}
}