contract c3135{
  /**
   * @notice Checks if the sale is Live.
   */
  function isSaleLive() public constant returns (bool) {
    return ( 
        initialized == true &&
        getPhase() != 0 &&
        goalReached() == false // Goal must not already be reached
    );
  }
}