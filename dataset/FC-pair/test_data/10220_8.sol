contract c10220{
  /**
   * Unfreezes frozen address.
   */
  function unfreeze(address _addr) onlyOwner {
      frozen[_addr] = false;
  }
}