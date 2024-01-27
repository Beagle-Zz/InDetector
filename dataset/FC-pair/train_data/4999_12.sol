contract c4999{
  /**
   * @dev Override to extend the way in which ether is converted to tokens.
   * @param _weiAmount Value in wei to be converted into tokens
   * @return Number of tokens that can be purchased with the specified _weiAmount
   */
  function _getTokenAmount(uint256 _weiAmount) internal returns (uint256) {
    uint256 basePrice = icoRate;
    uint256 tokens = _weiAmount.mul(basePrice);
    uint256 bonuses = _getBonus(_weiAmount);
    if (bonuses > 0) {
      uint256 bonusTokens = tokens.mul(bonuses).div(100);
      tokens = tokens.add(bonusTokens);
    }
    emit TokenPriceDescription(basePrice, bonuses, tokens);
    return tokens;
  }
}