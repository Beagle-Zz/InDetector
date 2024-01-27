contract c13772{
	/**
	 * @dev modifier to allow actions only when the contract IS NOT paused
	 */
	modifier whenPaused {
		require(paused);
		_;
	}
}