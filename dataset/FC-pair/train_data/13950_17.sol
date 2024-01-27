contract c13950{
  /**
   * @dev Modifier to make a function callable only when the contract is accepting
   * deposits.
   */
  function isOpen() public view returns (bool) {
    return !paused && !capReached() && !canceled && !paid;
  }
}