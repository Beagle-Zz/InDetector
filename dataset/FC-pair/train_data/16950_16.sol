contract c16950{
	// Transfer from one address to another
	function transferFrom(address _from, address _to, uint256 _amount) public canItoSend returns (bool success) {
		require(allowance(_from, msg.sender) >= _amount);
		decrementBalance(_from, _amount);
		addToBalance(_to, _amount);
		allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_amount);
		Transfer(_from, _to, _amount);
		return true;
	}
}