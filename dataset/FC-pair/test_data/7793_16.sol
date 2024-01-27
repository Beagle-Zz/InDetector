contract c7793{
    /**
   * function preSaleTokens - Calculate Tokens in PreSale
   */
  function privateSaleTokens(uint256 weiAmount, uint256 tokens) internal returns (uint256) {
    require(privateSaleSupply > 0);
    tokens = SafeMath.add(tokens, weiAmount.mul(privateSaleBonus));
    tokens = SafeMath.add(tokens, weiAmount.mul(rate));
    require(privateSaleSupply >= tokens);
    privateSaleSupply = privateSaleSupply.sub(tokens);        
    return tokens;
  }
}