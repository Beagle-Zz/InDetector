contract c7221{
  /**
   * @dev Adds list of addresses to whitelist. Not overloaded due to limitations with truffle testing.
   * @param _beneficiaries Addresses to be added to the whitelist
   */
  function addAddressesToWhitelist(address[] _beneficiaries) external onlyOwnerOrCrowdsale {
    for (uint256 i = 0; i < _beneficiaries.length; i++) {
      addAddressToWhitelist(_beneficiaries[i]);
    }
  }
}