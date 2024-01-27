contract c3699{
  /**
   * @dev Calculates amount of tokens by cents
   * @param _cents deposit amount in USD cents
   * @return amount of tokens investor receive for the deposit
   */
  function computeTokens(uint256 _cents) public view returns (uint256) {
    uint256 tokens = _cents.mul(10 ** 18).div(tokenPriceInCents);
    (uint256 bonusPercent, ) = computeBonuses(_cents);
    uint256 bonusTokens = tokens.mul(bonusPercent).div(100);
    if (_cents >= minDepositInCents) {
      return tokens.add(bonusTokens);
    }
  }
}