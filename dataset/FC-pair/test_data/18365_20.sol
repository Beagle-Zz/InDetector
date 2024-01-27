contract c18365{
  /**
   * @dev Validation of an incoming purchase. Use require statements to revert state when conditions are not met. Use super to concatenate validations.
   * Part of OpenZeppelin internal interface.
   * @param _beneficiary Token purchaser
   * @param _weiAmount Amount of wei contributed
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal whenNotClosed {
    super._preValidatePurchase(_beneficiary, _weiAmount);
  }
}