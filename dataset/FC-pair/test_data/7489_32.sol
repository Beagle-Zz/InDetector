contract c7489{
  /// @dev Adds single address to whitelist
  /// @param _beneficiary Address to be added to the whitelist
  function addToWhitelist(address _beneficiary) external onlyOwner {
    whitelist[_beneficiary] = true;
    WhitelistAddressAdded(_beneficiary);
  }
}