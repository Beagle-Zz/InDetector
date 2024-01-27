contract c8297{
  // -----------------------------------------
  // Internal interface (extensible)
  // -----------------------------------------
  /**
   * @dev Validation of an incoming purchase. Use require statemens to revert state when conditions are not met. Use super to concatenate validations.
   * @param _beneficiary Address performing the token purchase
   * @param _weiAmount Value in wei involved in the purchase
   * @param _usdCents Value in usd cents involved in the purchase
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount, uint256 _usdCents) internal view {
    require(_beneficiary != address(0));
    if (currentStage == Stages.Private) {
      require(_usdCents >= 2500000); // 25,000 USD in cents
      require(_usdCents <= 25000000); // 250,000 USD in cents
    } else if(currentStage == Stages.PreIco) {
      require(_usdCents >= 240000); // 2,500 USD in cents
    } else if(currentStage == Stages.Ico) {
      require(_weiAmount > 100 finney); // 0.1 ETH
    } else {
      revert();
    }
  }
}