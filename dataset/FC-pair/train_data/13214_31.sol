contract c13214{
  /**
   * A token purchase with anti-money laundering
   *
   * ©return tokenAmount How many tokens where bought
   */
  function buyWithKYCData(bytes dataframe, uint8 v, bytes32 r, bytes32 s) public payable returns(uint tokenAmount) {
    // Presale ended / emergency abort
    require(!halted);
    bytes32 hash = sha256(dataframe);
    var (whitelistedAddress, customerId, minETH, maxETH, pricingInfo) = getKYCPayload(dataframe);
    uint multiplier = 10 ** 18;
    address receiver = msg.sender;
    uint weiAmount = msg.value;
    // The payload was created by token sale server
    require(ecrecover(hash, v, r, s) == signerAddress);
    // Determine if it's a good time to accept investment from this participant
    if(getState() == State.PreFunding) {
      // Are we whitelisted for early deposit
      require(earlyParticipantWhitelist[receiver]);
    } else if(getState() == State.Funding) {
      // Retail participants can only come in when the crowdsale is running
      // pass
    } else {
      // Unwanted state
      revert;
    }
    if(investedAmountOf[receiver] == 0) {
       // A new investor
       investorCount++;
    }
    // Update per investor amount
    investedAmountOf[receiver] = investedAmountOf[receiver].plus(weiAmount);
    // Update totals
    weiRaised = weiRaised.plus(weiAmount);
    // Check that we did not bust the cap
    require(!isBreakingCap(weiAmount, tokenAmount, weiRaised, tokensSold));
    require(investedAmountOf[msg.sender] >= minETH * multiplier / 10000);
    require(investedAmountOf[msg.sender] <= maxETH * multiplier / 10000);
    // Pocket the money, or fail the crowdsale if we for some reason cannot send the money to our multisig
    require(multisigWallet.send(weiAmount));
    // Tell us invest was success
    Prepurchased(receiver, weiAmount, tokenAmount, customerId, pricingInfo);
    return 0; // In presale we do not issue actual tokens tyet
  }
}