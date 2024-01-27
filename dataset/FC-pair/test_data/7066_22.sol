contract c7066{
  /**
   * Unfreeze token transfers.
   */
  function unfreezeTransfers () public delegatable payable {
    require (msg.sender == owner);
    if (frozen) {
      frozen = false;
      Unfreeze ();
    }
  }
}