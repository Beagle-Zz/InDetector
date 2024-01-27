contract c13307{
	// ------------------------------------------------------------------------
	// Returns the amount of tokens approved by the owner that can be
	// transferred to the spender's account
	// ------------------------------------------------------------------------
	function allowance(address tokenOwner, address spender) public constant returns (uint) {
		return allowed[tokenOwner][spender];
	}
}