contract c12596{
  /**
   * @dev Function to enable transfer.
   * @return True if the operation was successful.
   */
  function disableTransfer() onlyOwner public returns (bool) {
    transferEnabled = false;
    return true;
  }
}