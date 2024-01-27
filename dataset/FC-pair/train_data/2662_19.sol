contract c2662{
  /**
   * Limit token transfer until the crowdsale is over.
   *
   */
  modifier canTransferReleasable(address _sender) {
    if(!released) {
        if(!transferAgents[_sender]) {
            revert();
        }
    }
    _;
  }
}