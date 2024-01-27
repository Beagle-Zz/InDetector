contract c528{
	/**
	 * @dev modifier to allow actions only when the contract IS paused
	 */
	modifier whenNotPaused() {
		require(!paused);
		_;
	}
}