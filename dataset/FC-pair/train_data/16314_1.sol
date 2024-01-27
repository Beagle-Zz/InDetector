contract c16314{
	// Transfer amount of tokens from a specified address to a recipient.
	function transferFrom(address _from, address _recipient, uint _amount)
		returns (bool o_success)
	{
		return super.transferFrom(_from, _recipient, _amount);
	}
}