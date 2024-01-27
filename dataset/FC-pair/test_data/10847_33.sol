contract c10847{
	/// @dev Create token with _name, internally.
	function _createToken(string _name) internal {
		uint id = countries.push( Country(_name, initPrice) ) - 1;
		tokenOwner[id] = msg.sender;
		ownedTokensCount[msg.sender] = ownedTokensCount[msg.sender].add(1);
	}
}