contract c4999{
  /**
   * @dev Validation of an incoming purchase. Use require statements to revert state when conditions are not met. Use super to concatenate validations.
   * @param _beneficiary Address performing the token purchase
   * @param _weiAmount Value in wei involved in the purchase
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal view {
    require(_beneficiary != address(0));
    require(_weiAmount >= 100 finney);
    if (currentStage == Stages.Ico1) require(_weiAmount <= 1000 ether);
    else if (currentStage == Stages.Ico2) require(_weiAmount <= 500 ether);
    else if (currentStage == Stages.Ico3) require(_weiAmount <= 500 ether);
    else revert();
  }
}