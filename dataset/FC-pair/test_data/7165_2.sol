contract c7165{
	// This function is called from the diipcoin contract
	function tokenFallback(
		address _sender,
	    uint _value,	    
	    uint[] _team
	) 
		public beforeDeadline diipCoinOnly returns (bool) 
	{
		require(startlistUploaded);	    
	    return commitTeam(_sender, _value, _team);
	}
}