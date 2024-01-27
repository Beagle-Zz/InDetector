contract c7017{
  /**
   * @dev Calculate amount of tokens for a given wei amount. Apply special bonuses depending on
   * @param weiAmount Amount of wei for token purchase.
   * @param bonusPercent Percentage of bonus tokens.
   * @return Number of tokens with possible bonus.
   */
  function getTokenAmount(
    uint256 weiAmount,
    uint256 bonusPercent
  )
    internal
    view
    returns(uint256)
  {
    uint256 tokens = weiAmount.mul(rate);
    if (bonusPercent > 0) {
      uint256 bonusTokens = tokens.mul(bonusPercent).div(uint256(100)); // tokens * bonus (%) / 100%
      tokens = tokens.add(bonusTokens);
    }
    return tokens;
  }
}