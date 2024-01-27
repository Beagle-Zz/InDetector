contract c7583{
  /**
   * Freeze token transfers.
   * May only be called by smart contract owner.
   */
  function freezeTransfers () public {
    require (msg.sender == owner);
    if (!frozen) {
      frozen = true;
      Freeze ();
    }
  }
}