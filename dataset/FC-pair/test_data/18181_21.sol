contract c18181{
  /**
   * @dev Removes single address from whitelist.
   * @param _whitelistAddress Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _whitelistAddress) external onlyOwner {
    whitelist[_whitelistAddress] = false;
  }
}