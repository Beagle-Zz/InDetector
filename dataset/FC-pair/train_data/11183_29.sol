contract c11183{
  /**
   * Limit token transfer until the crowdsale is over.
   *
   */
  modifier canTransfer(address _sender) {
    if(!released) {
        if(!transferAgents[_sender]) {
            throw;
        }
    }
    _;
  }
}