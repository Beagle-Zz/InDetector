contract c13488{
  /**
   * @dev Make an investment.
   *
   * Crowdsale must be running for one to invest.
   * We must have not pressed the emergency brake.
   *
   * @param receiver The Ethereum address who receives the tokens
   * @param customerId (optional) UUID v4 to track the successful payments on the server side'
   * @param tokenAmount Amount of tokens which be credited to receiver
   *
   * @return tokensBought How mony tokens were bought
   */
  function buyTokens(address receiver, uint128 customerId, uint256 tokenAmount) stopInEmergency internal returns(uint tokensBought) {
    // Determine if it's a good time to accept investment from this participant
    if(getState() == State.PreFunding) {
      // Are we whitelisted for early deposit
      if(!earlyParticipantWhitelist[receiver]) {
        throw;
      }
    } else if(getState() == State.Funding) {
      // Retail participants can only come in when the crowdsale is running
      // pass
    } else {
      // Unwanted state
      throw;
    }
    uint weiAmount = msg.value;
    // Dust transaction
    require(tokenAmount != 0);
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
    if(pricingStrategy.isPresalePurchase(receiver)) {
        presaleWeiRaised = presaleWeiRaised.plus(weiAmount);
    }
    // Check that we did not bust the cap
    require(!isBreakingCap(weiAmount, tokenAmount, weiRaised, tokensSold));
    assignTokens(receiver, tokenAmount);
    // Pocket the money, or fail the crowdsale if we for some reason cannot send the money to our multisig
    if(!multisigWallet.send(weiAmount)) throw;
    // Tell us invest was success
    Invested(receiver, weiAmount, tokenAmount, customerId);
    return tokenAmount;
  }
}