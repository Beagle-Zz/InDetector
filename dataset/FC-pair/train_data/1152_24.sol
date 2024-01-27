contract c1152{
  // How much Ether we get from selling N tokens
  function tokensToEthereum_(uint _tokens)
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
    // First, separate out the sell into two segments:
    //  1) the amount of tokens selling at the ICO price.
    //  2) the amount of tokens selling at the variable (pyramid) price
    uint tokensToSellAtICOPrice = 0;
    uint tokensToSellAtVariablePrice = 0;
    if (tokenSupply <= tokensMintedDuringICO) {
      // Option One: All the tokens sell at the ICO price.
      tokensToSellAtICOPrice = _tokens;
    } else if (tokenSupply > tokensMintedDuringICO && tokenSupply - _tokens >= tokensMintedDuringICO) {
      // Option Two: All the tokens sell at the variable price.
      tokensToSellAtVariablePrice = _tokens;
    } else if (tokenSupply > tokensMintedDuringICO && tokenSupply - _tokens < tokensMintedDuringICO) {
      // Option Three: Some tokens sell at the ICO price, and some sell at the variable price.
      tokensToSellAtVariablePrice = tokenSupply.sub(tokensMintedDuringICO);
      tokensToSellAtICOPrice      = _tokens.sub(tokensToSellAtVariablePrice);
    } else {
      // Option Four: Should be impossible, and the compiler should optimize it out of existence.
      revert();
    }
    // Sanity check:
    assert(tokensToSellAtVariablePrice + tokensToSellAtICOPrice == _tokens);
    // Track how much Ether we get from selling at each price function:
    uint ethFromICOPriceTokens;
    uint ethFromVarPriceTokens;
    // Now, actually calculate:
    if (tokensToSellAtICOPrice != 0) {
      /* Here, unlike the sister equation in ethereumToTokens, we DON'T need to multiply by 1e18, since
         we will be passed in an amount of tokens to sell that's already at the 18-decimal precision.
         We need to divide by 1e18 or we'll have too much Ether. */
      ethFromICOPriceTokens = tokensToSellAtICOPrice.mul(tokenPriceInitial_).div(1e18);
    }
    if (tokensToSellAtVariablePrice != 0) {
      /* Note: Unlike the sister function in ethereumToTokens, we don't have to calculate any "virtual" token count.
         This is because in sells, we sell the variable price tokens **first**, and then we sell the ICO-price tokens.
         Thus there isn't any weird stuff going on with the token supply.
         We have the equations for total investment above; note that this is for TOTAL.
         To get the eth received from this sell, we calculate the new total investment after this sell.
         Note that we divide by 1e6 here as the inverse of multiplying by 1e6 in ethereumToTokens. */
      uint investmentBefore = toPowerOfThreeHalves(tokenSupply.div(MULTIPLIER * 1e6)).mul(2).div(3);
      uint investmentAfter  = toPowerOfThreeHalves((tokenSupply - tokensToSellAtVariablePrice).div(MULTIPLIER * 1e6)).mul(2).div(3);
      ethFromVarPriceTokens = investmentBefore.sub(investmentAfter);
    }
    uint totalEthReceived = ethFromVarPriceTokens + ethFromICOPriceTokens;
    assert(totalEthReceived > 0);
    return totalEthReceived;
  }
}