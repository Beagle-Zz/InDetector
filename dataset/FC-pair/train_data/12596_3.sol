contract c12596{
  /**
   * @dev Function to enable transfer.
   * @return True if the operation was successful.
   */
  function enableTransfer() onlyOwner public returns (bool) {
    transferEnabled = true;
    return true;
  }
}