contract c3686{
  /**
   * @dev Enables the token transfer
   */
  function enableTransfer() public {
    require(transferEnablingDate != 0 && now >= transferEnablingDate);
    transfersEnabled = true;
  }
}