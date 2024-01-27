contract c4482{
    // Use it to get your real TAI balance
    // ____________________________________________________________________________________
	function balanceOf(address _owner) public constant returns(uint256 tokens) 
	{
		require(_owner != 0x0);
		return balances[_owner];
	}
}