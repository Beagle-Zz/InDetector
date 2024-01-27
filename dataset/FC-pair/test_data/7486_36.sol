contract c7486{
  /*
   *  Internal Functions
   */
  /// @dev Extend parent behavior to check if current stage should close. Must call super to ensure the enforcement of the whitelist.
  /// @param _beneficiary Token purchaser
  /// @param _weiAmount Amount of wei contributed
  function _preValidatePurchase(address _beneficiary, uint256 _weiAmount)
    internal
    whenNotPaused
    whenNotFinalized
   {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    // Beneficiary's total should be between the minimum and maximum purchase amounts
    uint256 _totalPurchased = purchaseRecords[_beneficiary].add(_getTokenAmount(_weiAmount));
    require(_totalPurchased >= minimumTokenPurchase);
    require(_totalPurchased <= maximumTokenPurchase);
    // Must make the purchase from the intended whitelisted address
    require(msg.sender == _beneficiary);
    // Must be after the start time
    require(now >= crowdsaleStartTime);
  }
}