contract c16314{
	// Transfer amount of tokens from sender account to recipient.
	function transfer(address _recipient, uint _amount)
		returns (bool o_success)
	{
		return super.transfer(_recipient, _amount);
	}
}