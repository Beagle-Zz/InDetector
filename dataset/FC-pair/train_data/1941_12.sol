contract c1941{
  /**
   * Unfreeze ALL token transfers.
   * May only be called by smart contract owner.
   */
  function unfreezeTransfers () {
    require (msg.sender == owner);
    if (frozen) {
      frozen = false;
      emit Unfreeze ();
    }
  }
}