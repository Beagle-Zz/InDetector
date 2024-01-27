contract c7789{
  /**
   * @dev Enables token transfers.
   */
  function enableTransfer()
    onlyOwner()
    external
  {
    transferEnabled = true;
  }
}