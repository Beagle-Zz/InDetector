contract c7465{
  /**
   * @dev Adds single address to whitelist.
   * @param _beneficiary Address to be added to the whitelist
   */
  function addAddressToWhitelist(address _beneficiary) public onlyOwnerOrCrowdsale {
    whitelist[_beneficiary] = true;
    emit WhitelistedAddressAdded(_beneficiary);
  }
}