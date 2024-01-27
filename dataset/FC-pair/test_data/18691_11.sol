contract c18691{
  /**
   * Make an investment.
   *
   * Crowdsale must be running for one to invest.
   * We must have not pressed the emergency brake.
   *
   * @param receiver The Ethereum address who receives the tokens
   * @param customerId (optional) UUID v4 to track the successful payments on the server side'
   *
   * @return tokenAmount How mony tokens were bought
   */
  function investInternal(address receiver, uint128 customerId) stopInEmergency onlyWhitelist internal returns(uint tokensBought) {
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
    // Account presale sales separately, so that they do not count against pricing tranches
    uint tokenAmount = pricingStrategy.calculatePrice(weiAmount, weiRaised - presaleWeiRaised, tokensSold, msg.sender, token.decimals());
    // Dust transaction
    require(tokenAmount != 0);
    // Check that the tx is a reasonable volume for the tranche
    if (trancheMinTx > 0) {
      uint trancheVolume = pricingStrategy.getCurrentTrancheVolume(tokensSold);
      uint maxVolume = trancheVolume / trancheMinTx;
      require(tokenAmount <= maxVolume);
    }
    if(maximumPurchaseFraction > 0) {
      uint256 maximumPurchase = token.totalSupply() / maximumPurchaseFraction;
      uint256 willHaveTokens = tokenAmountOf[receiver] + tokenAmount;
      require(willHaveTokens <= maximumPurchase);
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