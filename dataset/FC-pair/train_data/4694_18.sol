contract c4694{
  // -----------------------------------------
  // Private PreSale external Interface
  // -----------------------------------------
  /**
   * @dev Checks whether the cap has been reached. 
   * @return Whether the cap was reached
   */
  function capReached() public view returns (bool) {
    return tokensIssued >= MAX_TOKENS;
  }
}