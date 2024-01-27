contract c4482{
	// Use it to get your current TAI balance in readable format (the value will be rounded)
    // ____________________________________________________________________________________
	function balanceOfReadable(address _owner) public constant returns(uint256 tokens) 
	{
		require(_owner != 0x0);
		return balances[_owner] / 1e2;
	}
}