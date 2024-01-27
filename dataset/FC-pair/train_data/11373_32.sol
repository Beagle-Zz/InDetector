contract c11373{
  /**
   * Remove a group of users from whitelist B
   *
   * @param _beneficiaries List of addresses to be removed from whitelist
   */
  function removeUsersWhitelistB(address[] _beneficiaries) external onlyWhitelistManager {
    for (uint256 i = 0; i < _beneficiaries.length; i++) {
      whitelistB[_beneficiaries[i]] = false;
    }
  }
}