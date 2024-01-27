contract c10806{
  /**
   * Limit token transfer until the crowdsale is over.
   *
   */
  modifier canTransfer(address _sender) {
    require(released || transferAgents[_sender]);
    _;
  }
}