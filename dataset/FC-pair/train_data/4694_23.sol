contract c4694{
  /**
   * @dev Validation of an incoming purchase. Use require statements to revert state when conditions are not met. Use super to concatenate validations.
   * @param _beneficiary Address performing the token purchase
   * @param _weiAmount Value in wei involved in the purchase
   * @param _tokenAmount Amount of token to purchase
   */
  function preValidateChecks(address _beneficiary, uint256 _weiAmount, uint256 _tokenAmount) internal view {
    require(_beneficiary != address(0));
    require(_weiAmount != 0);
    require(now >= START_DATE);
    require(!closed);
    // KYC Check
    validateWhitelisted(_beneficiary);
    // Test Min Investment
    require(_tokenAmount >= MIN_TOKEN_INVEST);
    // Test hard cap
    require(tokensIssued.add(_tokenAmount) <= MAX_TOKENS);
  }
}