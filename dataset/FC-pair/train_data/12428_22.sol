contract c12428{
	/**
	 * @dev Locks given allocation address with timestamp
	 */
	function timelockAllocationAddress(
		address allocationAddress,
		uint32 timelockTillDate
	) public onlyOwner returns (bool) {
		require(token != address(0));
		return token.setInitialAllocationTimelock(allocationAddress, timelockTillDate);
	}
}