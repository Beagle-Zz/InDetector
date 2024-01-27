contract c18146{
	// Function that is called when a user or another contract wants to transfer funds .
	function transfer(address _to, uint256 _value, bytes _data) public returns (bool success) {
		return transfer( _to, _value, _data, "tokenFallback(address,uint256,bytes)");
	}
}