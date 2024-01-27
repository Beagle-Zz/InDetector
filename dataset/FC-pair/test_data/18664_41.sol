contract c18664{
  /**
   * @dev Removes single address from whitelist. 
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _beneficiary) external OnlyWhiteListAgent {
    whitelist[_beneficiary] = false;
  }
}