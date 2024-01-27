contract c18433{
	// The following functions are used by the front-end for display purposes.
	// Returns the number of tokens currently held by _owner.
	function balanceOf(address _owner) public constant returns (uint256 balance) {
		return tokenBalance[_owner];
	}
}