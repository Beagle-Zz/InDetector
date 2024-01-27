contract c7221{
  /**
   * @dev Removes single address from whitelist.
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeAddressFromWhitelist(address _beneficiary) external onlyOwnerOrCrowdsale {
    whitelist[_beneficiary] = false;
    emit WhitelistedAddressRemoved(_beneficiary);
  }
}