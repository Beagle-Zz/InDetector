contract c7828{
  /**
   * @dev Adds single address to whitelist.
   * Use this also to update
   * @param _beneficiary Address to be added to the whitelist
   */
  function addToWhitelist(address _beneficiary, uint256 _cap, bool _accredited) external onlyOwner {
    caps[_beneficiary] = _cap;
    accredited[_beneficiary] = _accredited;
  }
}