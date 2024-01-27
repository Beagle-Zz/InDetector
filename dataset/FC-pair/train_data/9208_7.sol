contract c9208{
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
    uint weiAmount = msg.value;    
    // Account presale sales separately, so that they do not count against pricing tranches
    uint tokenAmount = pricingStrategy.calculatePrice(weiAmount, weiRaised - presaleWeiRaised, tokensSold, msg.sender, token.decimals());
    if (tokenAmount == 0) {
      // Dust transaction
      revert();
    }
    //get the eth cap for the time period
    uint currentFgcCap = getCurrentFgcCap();
    if (tokenAmount > currentFgcCap) {
      // We don't allow more than the current cap
      revert();
    }
    if (investedAmountOf[receiver] == 0) {
       // A new investor
       investorCount++;
    }
    // Update investor
    investedAmountOf[receiver] = investedAmountOf[receiver].add(weiAmount);
    tokenAmountOf[receiver] = tokenAmountOf[receiver].add(tokenAmount);    
    // Update totals
    weiRaised = weiRaised.add(weiAmount);
    tokensSold = tokensSold.add(tokenAmount);
    if (pricingStrategy.isPresalePurchase(receiver)) {
        presaleWeiRaised = presaleWeiRaised.add(weiAmount);
    }
    // Check that we did not bust the cap
    if (isBreakingCap(weiAmount, tokenAmount, weiRaised, tokensSold)) {
      revert();
    }
    assignTokens(receiver, tokenAmount);
    // Pocket the money
    if (!multisigWallet.send(weiAmount)) 
      revert();
    // Tell us invest was success
    Invested(receiver, weiAmount, tokenAmount, customerId);
  }
}