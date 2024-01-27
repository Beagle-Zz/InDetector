contract c10672{
	/**
   	* @dev Throws if game is paused
   	*/
	modifier buyAvailable() {
		require(paused == false);
		_;
	}
}