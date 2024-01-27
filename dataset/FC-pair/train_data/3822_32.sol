contract c3822{
  /**
   * @dev Extend parent behavior requiring beneficiary to be in whitelist.
   * @param _beneficiary Token beneficiary
   * @param _weiAmount Amount of wei contributed
   */
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    onlyIfWhitelisted(_beneficiary)
    internal
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
  }
}