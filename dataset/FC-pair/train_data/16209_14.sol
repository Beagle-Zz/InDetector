contract c16209{
  /**
   * @dev Modifier to make a function callable only when the contract is started.
   */
  modifier whenStarted() {
	require( started || authorized[msg.sender] );
    _;
  }
}