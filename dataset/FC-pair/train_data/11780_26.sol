contract c11780{
  /**
   * We are sold out when our approve pool becomes empty.
   */
  function isCrowdsaleFull() public constant returns (bool) {
    return getTokensLeft() == 0;
  }
}