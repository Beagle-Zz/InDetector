contract c10165{
  /**
   * @notice Override BaseCrowdsale.calculateToFund function.
   * Check if period is on sale and apply cap if needed.
   */
  function calculateToFund(address _beneficiary, uint256 _weiAmount) internal view returns (uint256) {
    uint256 weiAmount = _weiAmount;
    uint8 currentStage;
    bool onSale;
    (currentStage, onSale) = getStageIndex();
    require(onSale);
    Stage memory p = stages[currentStage];
    // Check kyc if needed for this period
    if (p.kyc) {
      require(super.registered(_beneficiary));
    }
    // check min purchase limit of the period
    require(weiAmount >= uint(p.minPurchaseLimit));
    // reduce up to max purchase limit of the period
    if (p.maxPurchaseLimit != 0 && weiAmount > uint(p.maxPurchaseLimit)) {
      weiAmount = uint(p.maxPurchaseLimit);
    }
    // pre-calculate `toFund` with the period's cap
    if (p.cap > 0) {
      uint256 postWeiRaised = uint256(p.weiRaised).add(weiAmount);
      if (postWeiRaised > p.cap) {
        weiAmount = uint256(p.cap).sub(p.weiRaised);
      }
    }
    // get `toFund` with the cap of the sale
    return super.calculateToFund(_beneficiary, weiAmount);
  }
}