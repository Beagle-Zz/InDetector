contract c16777{
  /**
   * Freeze ALL token transfers.
   * May only be called by smart contract owner.
   */
  function freezeTransfers () {
    require (msg.sender == owner);
    if (!frozen) {
      frozen = true;
      emit Freeze ();
    }
  }
}