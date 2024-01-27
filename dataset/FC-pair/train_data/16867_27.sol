contract c16867{
  /**
   * @dev Adds single address to whitelist.
   * @param _beneficiary Address to be added to the whitelist
   */
  function addToWhitelist(address _beneficiary) public onlyBy(kycAdmin) {
    whitelist[_beneficiary] = true;
    emit AddToWhitelist(_beneficiary);
  }
}