contract c574{
	/**
	 * @dev called by the owner to unpause, returns to normal state
	 */
	function unpause() onlyOwner whenPaused public returns (bool) {
		paused = false;
		emit Unpause();
		return true;
	}
}