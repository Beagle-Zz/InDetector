contract c7583{
  /**
   * Unfreeze token transfers.
   * May only be called by smart contract owner.
   */
  function unfreezeTransfers () public {
    require (msg.sender == owner);
    if (frozen) {
      frozen = false;
      Unfreeze ();
    }
  }
}