contract c16445{
	/**
 	 * @dev Throws if called by any account other than the owner.
 	 */
	modifier onlyAD(){
  	require(msg.sender == AD);
  	_;
	}
}