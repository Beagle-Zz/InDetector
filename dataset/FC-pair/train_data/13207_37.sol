contract c13207{
  /**
   * @dev Returns the bonus multiplier to calculate the purchase rate
   * @param _weiAmount Purchase amount
   */
  function getBonusMultiplier(uint256 _weiAmount) internal view returns (uint256) {
    if (isMainSaleRunning()) {
      return 100;
    }
    else if (isPreSaleRunning()) {
      if (_weiAmount >= PRE_SALE_30_BONUS_MIN) {
        // 30% bonus
        return 130;
      }
      else if (_weiAmount >= PRE_SALE_20_BONUS_MIN) {
        // 20% bonus
        return 120;
      }
      else if (_weiAmount >= PRE_SALE_15_BONUS_MIN) {
        // 15% bonus
        return 115;
      }
      else if (_weiAmount >= PRE_SALE_MIN_ETHER) {
        // 10% bonus
        return 110;
      }
      else {
        // Safeguard but this should never happen as aboveMinimumPurchase checks the minimum
        revert();
      }
    }
  }
}