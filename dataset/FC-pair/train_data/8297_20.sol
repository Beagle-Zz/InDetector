contract c8297{
  /**
   * @param _usdCents Value in usd cents to be converted into tokens
   * @return Number of tokens that can be purchased with the specified _usdCents
   */
  function _getTokenAmount(uint256 _usdCents) internal view returns (uint256) {
    uint256 tokens = _usdCents.div(tokenPrice).mul(1 ether);
    uint256 bonuses = 0;
    if (currentStage == Stages.Private) bonuses = tokens.mul(privateBonuses).div(100);
    if (currentStage == Stages.PreIco) bonuses = tokens.mul(preIcoBonuses).div(100);
    if (bonuses > 0) tokens = tokens.add(bonuses);
    return tokens;
  }
}