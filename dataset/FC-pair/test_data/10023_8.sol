contract c10023{
  /**
   * Allow anonymous contributions to this crowdsale.
   */
  function invest(address addr) public payable {
    investInternal(addr, 0);
  }
}