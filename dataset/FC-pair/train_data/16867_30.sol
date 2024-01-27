contract c16867{
  /**
   * @dev Removes list of addresses from whitelist.
   * @param _beneficiaries List of addresses to be removed to the whitelist
   */
  function removeManyFromWhitelist(address[] _beneficiaries) external onlyBy(kycAdmin) {
    for (uint256 i = 0; i < _beneficiaries.length; i++) removeFromWhitelist(_beneficiaries[i]);
  }
}