contract c2338{
  /**
   * @dev Calculates tokens for this stage
   * @return Number of tokens that can be purchased in this stage + wei left
   */
  function getTokensForStage(uint256 _sold, uint256 _weiAmount) public view returns (uint256 tokens, uint256 left) {
    uint8 stage = getStage(_sold);
    if (stage == stages.length) {
      return (0, _weiAmount);
    }
    if (stage == 0 && now > end) {
      revert("Sale is refundable, unable to buy");
    }
    uint256 rate = rates[stage];
    tokens = _weiAmount.mul(rate);
    left = 0;
    uint8 newStage = getStage(_sold.add(tokens));
    if (newStage != stage) {
      tokens = stages[stage].sub(_sold);
      uint256 weiSpent = (tokens.add(rate).sub(1)).div(rate);
      left = _weiAmount.sub(weiSpent);
    }
  }
}