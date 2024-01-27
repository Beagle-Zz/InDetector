contract c12429{
	/**
	 * @dev Sets time lock for given allocation address
	 */
	function setInitialAllocationTimelock(
		address allocationAddress,
		uint32 timelockTillDate
	) external onlyController returns (bool) {
		require(allocationAddress != address(0));
		require(timelockTillDate >= now);
		timelockedAddresses[allocationAddress] = timelockTillDate;
		emit InitiallAllocationTimelocked(allocationAddress, timelockTillDate);
		return true;
	}
}