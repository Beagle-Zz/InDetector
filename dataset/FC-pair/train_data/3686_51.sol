contract c3686{
  /**
      OPEN ZEPPELIN OVERRIDES
  **/
  /**
   * @dev Validation of an incoming purchase. Use require statements to revert state when conditions are not met. Use super to concatenate validations.
   * @param _beneficiary Address performing the token purchase
   * @param _weiAmount Value in wei involved in the purchase
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) isWhitelisted(_beneficiary) internal {
    require(_beneficiary == msg.sender);
    require(saleOpen(), "Sale is Closed");
    // Check for edge cases
    uint256 acceptedValue = _weiAmount;
    uint256 currentCap = getCurrentCap();
    uint256 raised = getRaisedForCurrentStage();
    if(contributions[_beneficiary].add(acceptedValue) > MAXIMUM_CONTRIBUTION){
      changeDue = (contributions[_beneficiary].add(acceptedValue)).sub(MAXIMUM_CONTRIBUTION);
      acceptedValue = acceptedValue.sub(changeDue);
    }
    if(raised.add(acceptedValue) >= currentCap){
      changeDue = changeDue.add(raised.add(acceptedValue).sub(currentCap));
      acceptedValue = _weiAmount.sub(changeDue);
      capReached = true;
    }
    require(capReached || contributions[_beneficiary].add(acceptedValue) >= MINIMUM_CONTRIBUTION ,"Contribution below minimum");
  }
}