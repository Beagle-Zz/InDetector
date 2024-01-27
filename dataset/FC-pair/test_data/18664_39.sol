contract c18664{
  /**
   * @dev Adds single address to whitelist.
   * @param _beneficiary Address to be added to the whitelist
   */
  function addToWhitelist(address _beneficiary) external OnlyWhiteListAgent {
    whitelist[_beneficiary] = true;
  }
}