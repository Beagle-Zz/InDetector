contract c18201{
  /**
   * Make an investment.
   *
   * Crowdsale must be running for one to invest.
   * We must have not pressed the emergency brake.
   *
   * @param receiver The Ethereum address who receives the tokens
   * @param customerId (optional) UUID v4 to track the successful payments on the server side
   *
   */
  function investInternal(address receiver, uint128 customerId) stopInEmergency private {
    // Determine if it's a good time to accept investment from this participant
    if(getState() == State.PreFunding) {
      // Are we whitelisted for early deposit
      throw;
    } else if(getState() == State.Funding) {
      // Retail participants can only come in when the crowdsale is running
      // pass
      if(isWhiteListed) {
        if(!earlyParticipantWhitelist[receiver].status) {
          throw;
        }
      }
    } else {
      // Unwanted state
      throw;
    }
    uint weiAmount = msg.value;
    // Account presale sales separately, so that they do not count against pricing tranches
    uint tokenAmount = pricingStrategy.calculatePrice(weiAmount, weiRaised, tokensSold, msg.sender, token.decimals());
    if(tokenAmount == 0) {
      // Dust transaction
      throw;
    }
    if(isWhiteListed) {
      if(tokenAmount < earlyParticipantWhitelist[receiver].minCap && tokenAmountOf[receiver] == 0) {
        // tokenAmount < minCap for investor
        throw;
      }
      // Check that we did not bust the investor's cap
      if (isBreakingInvestorCap(receiver, tokenAmount)) {
        throw;
      }
      updateInheritedEarlyParticipantWhitelist(receiver, tokenAmount);
    } else {
      if(tokenAmount < token.minCap() && tokenAmountOf[receiver] == 0) {
        throw;
      }
    }
    if(investedAmountOf[receiver] == 0) {
       // A new investor
       investorCount++;
    }
    // Update investor
    investedAmountOf[receiver] = investedAmountOf[receiver].plus(weiAmount);
    tokenAmountOf[receiver] = tokenAmountOf[receiver].plus(tokenAmount);
    // Update totals
    weiRaised = weiRaised.plus(weiAmount);
    tokensSold = tokensSold.plus(tokenAmount);
    // Check that we did not bust the cap
    if(isBreakingCap(weiAmount, tokenAmount, weiRaised, tokensSold)) {
      throw;
    }
    assignTokens(receiver, tokenAmount);
    // Pocket the money
    if(!multisigWallet.send(weiAmount)) throw;
    // Tell us invest was success
    Invested(receiver, weiAmount, tokenAmount, customerId);
  }
}