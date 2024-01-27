contract c8308{
  /**
   * @dev Add affiliates in affiliate mapping
   * @param _affiliates List of all affiliates
   * @param _amount Amount earned
   */
  function addAffiliates(address[] _affiliates, uint256[] _amount) onlyOwner public {
    require(_affiliates.length > 0);
    require(_affiliates.length == _amount.length);
    for (uint256 i = 0; i < _affiliates.length; i++) {
      affiliates[_affiliates[i]] = _amount[i];
    }
  }
}