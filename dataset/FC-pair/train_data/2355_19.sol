contract c2355{
  /**
   * @dev Removes single address from whitelist.
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _beneficiary)onlyOwner public {
    whitelist[_beneficiary] = false;
  }
}