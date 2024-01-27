contract c1901{
  // How much Ether we get from selling N tokens
  function tokensToEthereum_(uint _tokens, uint tokenSupply)
  public
  view
  returns(uint)
  {
    require (_tokens >= MIN_TOKEN_SELL_AMOUNT, "Tried to sell too few tokens.");
    /*
     *  i = investment, p = price, t = number of tokens
     *
     *  i_current = p_initial * t_current                   (for t_current <= t_initial)
     *  i_current = i_initial + (2/3)(t_current)^(3/2)      (for t_current >  t_initial)
     *
     *  t_current = i_current / p_initial                   (for i_current <= i_initial)
     *  t_current = t_initial + ((3/2)(i_current))^(2/3)    (for i_current >  i_initial)
     */
    uint tokensToSellAtICOPrice;
    uint tokensToSellAtVariablePrice;
    (tokensToSellAtICOPrice, tokensToSellAtVariablePrice) = tokensToEthereum_1(_tokens, tokenSupply);
    uint ethFromICOPriceTokens = tokensToEthereum_2(tokensToSellAtICOPrice);
    uint ethFromVarPriceTokens = tokensToEthereum_3(tokensToSellAtVariablePrice, tokenSupply);
    uint totalEthReceived = ethFromVarPriceTokens + ethFromICOPriceTokens;
    assert(totalEthReceived > 0);
    return totalEthReceived;
  }
}