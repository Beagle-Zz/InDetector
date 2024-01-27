contract c12429{
	/**
	 * @dev Allows transfer of the tokens after locking conditions checking
	 */
	function transfer(
		address _to,
		uint256 _value
	) public onlyUnlocked(address(0)) returns (bool) {
		require(super.transfer(_to, _value));
		return true;
	}
}