contract c10236{
	/**
   	* @dev Throws if game is not paused
   	*/
	modifier isPaused() {
		require(paused == true);
		_;
	}
}