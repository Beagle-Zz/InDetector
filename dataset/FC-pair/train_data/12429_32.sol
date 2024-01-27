contract c12429{
	/**
	 * @dev Allows transfer of the tokens (with additional _data) after locking conditions checking
	 */
	function transfer(
		address _to,
		uint256 _value,
		bytes _data
	) public onlyUnlocked(address(0)) returns (bool) {
		require(super.transfer(_to, _value, _data));
		return true;
	}
}