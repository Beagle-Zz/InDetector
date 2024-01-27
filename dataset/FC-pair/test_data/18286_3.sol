contract c18286{
  /**
   * @dev The function can be called only by crowdsale agent.
   */
  modifier onlyCrowdsaleAgent() {
    assert(msg.sender == crowdsaleAgent);
    _;
  }
}