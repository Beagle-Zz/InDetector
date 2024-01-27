contract c540{
  /**
   * @dev Function to unpause transfer restriction
   */
  function unpauseTransfer() onlyOwner public {
    transferPaused = false;
  }
}