contract c13214{
  /**
   * Presale state machine management.
   *
   * Presale cannot fail; it is running until manually ended.
   *
   */
  function getState() public constant returns (State) {
    if (block.timestamp < startsAt) {
      return State.PreFunding;
    } else {
      return State.Funding;
    }
  }
}