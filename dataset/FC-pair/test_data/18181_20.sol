contract c18181{
  /**
   * @dev Adds list of addresses to whitelist. Not overloaded due to limitations with truffle testing.
   * @param _whitelistAddresses Addresses to be added to the whitelist
   */
  function addManyToWhitelist(address[] _whitelistAddresses) external onlyOwner {
    for (uint256 i = 0; i < _whitelistAddresses.length; i++) {
      whitelist[_whitelistAddresses[i]] = true;
    }
  }
}