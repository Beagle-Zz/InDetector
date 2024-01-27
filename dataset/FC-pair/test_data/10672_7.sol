contract c10672{
	/**
   	* @dev Throws if game is not paused
   	*/
	modifier isPaused() {
		require(paused == true);
		_;
	}
}