contract c7464{
  /**
   * @dev low level token purchase
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary, bytes _whitelistSign) public payable {
    // since the earlyInvestors are by definition autorised, we check first the earlyInvestors.
    if (!earlyInvestors.handleOffchainWhitelisted(_beneficiary, _whitelistSign)) {
      authorisedInvestors.handleOffchainWhitelisted(_beneficiary, _whitelistSign);
    }
    super.buyTokens(_beneficiary);
  }
}