contract c8553{
  /**
   * Limit token transfer until the crowdsale is over.
   *
   */
  modifier canTransfer(address _sender) {
    if(!released) {
        require(transferAgents[_sender]);
    }
    _;
  }
}