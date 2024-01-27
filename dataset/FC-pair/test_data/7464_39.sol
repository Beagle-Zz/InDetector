contract c7464{
  /**
   * @dev Validation of an incoming purchase. Allowas purchases only when crowdsale is not paused and the _beneficiary is authorized to buy.
   * The early investors went through the KYC process, so they are authorised by default.
   * @param _beneficiary Address performing the token purchase
   * @param _weiAmount Value in wei involved in the purchase
   */
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount) internal whenNotPaused {
    require(authorisedInvestors.whitelist(_beneficiary) || earlyInvestors.whitelist(_beneficiary));
    super._preValidatePurchase(_beneficiary, _weiAmount);
  }
}