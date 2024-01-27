contract c13608{
	/**
	 * @dev called by the owner to pause, triggers stopped state
	 */
	function pause() public onlyOwner whenNotPaused returns (bool) {
		paused = true;
		Pause();
		return true;
	}
}