contract c10819{
  /**
   * Unfreezes frozen address.
   */
  function unfreeze(address _addr) onlyOwner {
      frozen[_addr] = false;
  }
}