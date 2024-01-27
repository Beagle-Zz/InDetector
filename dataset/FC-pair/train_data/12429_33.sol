contract c12429{
	/**
	 * @dev Allows transfer of the tokens after locking conditions checking
	 */
	function transferFrom(
		address _from,
		address _to,
		uint256 _value
	) public onlyUnlocked(_from) returns (bool) {
		require(super.transferFrom(_from, _to, _value));
		return true;
	}
}