contract c16787{
  /**
   * @dev Calculate the amount tokens for a given Wei amount and the amount of change in Wei.
   * @param _weiAmount Whole number of Wei to be converted to tokens
   * @return whole amount of tokens for the given amount in Wei
   * @return change in Wei that is not sufficient to buy a whole token
   */
  function weiToTokens(uint256 _weiAmount) public view returns (uint256, uint256) {
    require(tokenNAVMicroUSD != uint256(0));
    require(weiPerUSD != uint256(0));
    uint256 tokens = _weiAmount.mul(million).div(weiPerUSD).div(tokenNAVMicroUSD);
    uint256 changeWei = _weiAmount.sub(tokensToWei(tokens));
    return (tokens, changeWei);
  }
}