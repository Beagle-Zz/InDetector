contract c10672{
	/**
   	* @dev Throws if game is paused
   	*/
	modifier cupAvailable() {
		require(cup.owner != address(0));
		_;
	}
}