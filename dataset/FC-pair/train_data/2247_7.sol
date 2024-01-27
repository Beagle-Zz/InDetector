contract c2247{
  /**
   * @dev Get dividends for this contract
   * @param _includeReferralBonus for including referrals in dividends.
   */
  function dividends(bool _includeReferralBonus) external view returns (uint256) {
    return P3D(0xB3775fB83F7D12A36E0475aBdD1FCA35c091efBe).myDividends(_includeReferralBonus);
  }
}