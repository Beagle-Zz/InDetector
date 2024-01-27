contract c11024{
  /**
   * @dev Add single address to whitelist.
   * @param _beneficiary Address to be added to the whitelist
   */
  function addToWhitelist(address _beneficiary) external onlyOwner {
    whitelist[_beneficiary] = true;
    emit WhitelistState(_beneficiary, true);
  }
}