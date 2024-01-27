contract c10847{
	/// @dev Return tokenid array
	function getTokenByOwner(address _owner) external view returns(uint[]) {
	    uint[] memory result = new uint[](ownedTokensCount[_owner]);
	    uint counter = 0;
	    for (uint i = 0; i < countries.length; i++) {
			if (tokenOwner[i] == _owner) {
				result[counter] = i;
				counter++;
			}
	    }
		return result;
  	}
}