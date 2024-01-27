contract c10129{
  /**
   * We are sold out when our approve pool becomes empty.
   */
  function isCrowdsaleFull() public constant returns (bool) {
    return weiRaised >= saleWeiCap;
  }
}