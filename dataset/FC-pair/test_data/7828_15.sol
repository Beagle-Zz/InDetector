contract c7828{
  /**
   * @dev Removes single address from whitelist.
   * @param _beneficiary Address to be removed to the whitelist
   */
  function removeFromWhitelist(address _beneficiary) external onlyOwner {
    caps[_beneficiary] = 0;
    accredited[_beneficiary] = false;
  }
}