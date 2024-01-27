contract c10220{
  /**
   * Freezes address (no transfer can be made from or to this address).
   */
  function freeze(address _addr) onlyOwner {
      frozen[_addr] = true;
  }
}