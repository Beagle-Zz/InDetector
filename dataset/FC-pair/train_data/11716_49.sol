contract c11716{
  /**
   * @dev Removes single address from whitelist.
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _beneficiary) external onlyAdmin {
    whitelist[_beneficiary] = false;
    emit RemovedFromWhitelist(_beneficiary);
  }
}