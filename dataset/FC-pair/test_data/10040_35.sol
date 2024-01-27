contract c10040{
  /**
   * Make an investment.
   *
   * The crowdsale must be running for one to invest.
   * We must have not pressed the emergency brake.
   *
   * @param receiver The Ethereum address who receives the tokens
   * @param customerId (optional) UUID v4 to track the successful payments on the server side
   *
   */
  function investInternal(address receiver, uint128 customerId) stopInEmergency notFinished private {
    // Determine if it's a good time to accept investment from this participant
    if (getState() == State.PreFunding) {
      // Are we whitelisted for early deposit
      require(earlyParticipantWhitelist[msg.sender]);
    }
    uint weiAmount;
    uint tokenAmount;
    (weiAmount, tokenAmount) = calculateTokenAmount(msg.value, receiver);
    // Sanity check against bad implementation.
    assert(weiAmount <= msg.value);
    // Dust transaction if no tokens can be given
    require(tokenAmount != 0);
    if (investedAmountOf[receiver] == 0) {
      // A new investor
      investorCount++;
    }
    updateInvestorFunds(tokenAmount, weiAmount, receiver, customerId);
    // Pocket the money
    multisigWallet.transfer(weiAmount);
    // Return excess of money
    returnExcedent(msg.value.sub(weiAmount), msg.sender);
  }
}