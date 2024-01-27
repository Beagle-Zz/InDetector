contract c18300{
  /**
   * @dev The function can be called only by crowdsale agent.
   */
  modifier onlyCrowdsaleAgent() {
    assert(msg.sender == crowdsaleAgent);
    _;
  }
}