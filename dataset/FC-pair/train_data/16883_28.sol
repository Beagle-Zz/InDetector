contract c16883{
  /**
   * @dev Adds list of addresses to whitelist.
   * @param _beneficiaries List of addresses to be added to the whitelist
   */
  function addManyToWhitelist(address[] _beneficiaries) external onlyBy(kycAdmin) {
    for (uint256 i = 0; i < _beneficiaries.length; i++) addToWhitelist(_beneficiaries[i]);
  }
}