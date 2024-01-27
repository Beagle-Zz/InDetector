contract c16867{
  /**
   * @dev Removes single address from whitelist.
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _beneficiary) public onlyBy(kycAdmin) {
    whitelist[_beneficiary] = false;
    emit RemoveFromWhitelist(_beneficiary);
  }
}