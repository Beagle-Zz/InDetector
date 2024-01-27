contract c1801{
  // How many tokens one gets from a certain amount of ethereum.
  function ethereumToTokens_(uint _ethereumAmount)
  public
  view
  returns(uint)
  {
    require(_ethereumAmount > MIN_ETH_BUYIN, "Tried to buy tokens with too little eth.");
    if (icoPhase) {
      return _ethereumAmount.div(tokenPriceInitial_) * 1e18;
    }
    /*
     *  i = investment, p = price, t = number of tokens
     *
     *  i_current = p_initial * t_current                   (for t_current <= t_initial)
     *  i_current = i_initial + (2/3)(t_current)^(3/2)      (for t_current >  t_initial)
     *
     *  t_current = i_current / p_initial                   (for i_current <= i_initial)
     *  t_current = t_initial + ((3/2)(i_current))^(2/3)    (for i_current >  i_initial)
     */
    // First, separate out the buy into two segments:
    //  1) the amount of eth going towards ico-price tokens
    //  2) the amount of eth going towards pyramid-price (variable) tokens
    uint ethTowardsICOPriceTokens = 0;
    uint ethTowardsVariablePriceTokens = 0;
    if (currentEthInvested >= ethInvestedDuringICO) {
      // Option One: All the ETH goes towards variable-price tokens
      ethTowardsVariablePriceTokens = _ethereumAmount;
    } else if (currentEthInvested < ethInvestedDuringICO && currentEthInvested + _ethereumAmount <= ethInvestedDuringICO) {
      // Option Two: All the ETH goes towards ICO-price tokens
      ethTowardsICOPriceTokens = _ethereumAmount;
    } else if (currentEthInvested < ethInvestedDuringICO && currentEthInvested + _ethereumAmount > ethInvestedDuringICO) {
      // Option Three: Some ETH goes towards ICO-price tokens, some goes towards variable-price tokens
      ethTowardsICOPriceTokens = ethInvestedDuringICO.sub(currentEthInvested);
      ethTowardsVariablePriceTokens = _ethereumAmount.sub(ethTowardsICOPriceTokens);
    } else {
      // Option Four: Should be impossible, and compiler should optimize it out of existence.
      revert();
    }
    // Sanity check:
    assert(ethTowardsICOPriceTokens + ethTowardsVariablePriceTokens == _ethereumAmount);
    // Separate out the number of tokens of each type this will buy:
    uint icoPriceTokens = 0;
    uint varPriceTokens = 0;
    // Now calculate each one per the above formulas.
    // Note: since tokens have 18 decimals of precision we multiply the result by 1e18.
    if (ethTowardsICOPriceTokens != 0) {
      icoPriceTokens = ethTowardsICOPriceTokens.mul(1e18).div(tokenPriceInitial_);
    }
    if (ethTowardsVariablePriceTokens != 0) {
      // Note: we can't use "currentEthInvested" for this calculation, we must use:
      //  currentEthInvested + ethTowardsICOPriceTokens
      // This is because a split-buy essentially needs to simulate two separate buys -
      // including the currentEthInvested update that comes BEFORE variable price tokens are bought!
      uint simulatedEthBeforeInvested = toPowerOfThreeHalves(tokenSupply.div(MULTIPLIER * 1e6)).mul(2).div(3) + ethTowardsICOPriceTokens;
      uint simulatedEthAfterInvested  = simulatedEthBeforeInvested + ethTowardsVariablePriceTokens;
      /* We have the equations for total tokens above; note that this is for TOTAL.
         To get the number of tokens this purchase buys, use the simulatedEthInvestedBefore
         and the simulatedEthInvestedAfter and calculate the difference in tokens.
         This is how many we get. */
      uint tokensBefore = toPowerOfTwoThirds(simulatedEthBeforeInvested.mul(3).div(2)).mul(MULTIPLIER);
      uint tokensAfter  = toPowerOfTwoThirds(simulatedEthAfterInvested.mul(3).div(2)).mul(MULTIPLIER);
      /* Note that we could use tokensBefore = tokenSupply + icoPriceTokens instead of dynamically calculating tokensBefore;
         either should work.
         Investment IS already multiplied by 1e18; however, because this is taken to a power of (2/3),
         we need to multiply the result by 1e6 to get back to the correct number of decimals. */
      varPriceTokens = (1e6) * tokensAfter.sub(tokensBefore);
    }
    uint totalTokensReceived = icoPriceTokens + varPriceTokens;
    assert(totalTokensReceived > 0);
    return totalTokensReceived;
  }
}