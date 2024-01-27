contract c7828{
  /**
   * @dev Extend parent behavior requiring purchase to respect the funding cap,
   * and that contribution should be >= minMillPurchase
   * @param _beneficiary Token purchaser
   * @param _weiAmount Amount of wei contributed
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    // Check for minimum contribution
    uint256 _millAmount = _toMill(_weiAmount);
    require(_millAmount >= minMillPurchase);
    // Check for funding cap
    uint256 _millRaised = millRaised.add(_millAmount);
    require(_millRaised <= millCap);
    millRaised = _millRaised;
  }
}