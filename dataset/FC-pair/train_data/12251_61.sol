contract c12251{
	/**
	 * @dev called by the owner to unpause, returns to normal state
	 */
	function unpause() public onlyOwner whenPaused returns (bool) {
		paused = false;
		Unpause();
		return true;
	}
}