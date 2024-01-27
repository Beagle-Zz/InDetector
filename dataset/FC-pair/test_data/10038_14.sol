contract c10038{
  /**
   * Limit token transfer until the crowdsale is over.
   */
  modifier canTransfer(address sender) {
    require(released || transferAgents[sender]);
    _;
  }
}