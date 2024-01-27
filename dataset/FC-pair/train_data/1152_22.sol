contract c1152{
  /*==========================================
  =            INTERNAL FUNCTIONS            =
  ==========================================*/
  /* Purchase tokens with Ether.
     During ICO phase, dividends should go to the bankroll
     During normal operation:
       0.5% should go to the master dividend card
       0.5% should go to the matching dividend card
       25% of dividends should go to the referrer, if any is provided. */
  function purchaseTokens(uint _incomingEthereum, address _referredBy)
  internal
  returns(uint)
  {
    require(_incomingEthereum >= MIN_ETH_BUYIN || msg.sender == bankrollAddress, "Tried to buy below the min eth buyin threshold.");
    uint toBankRoll;
    uint toReferrer;
    uint toTokenHolders;
    uint toDivCardHolders;
    uint dividendAmount;
    uint tokensBought;
    uint dividendTokensBought;
    uint remainingEth = _incomingEthereum;
    uint fee;
    // 1% for dividend card holders is taken off before anything else
    if (regularPhase) {
      toDivCardHolders = _incomingEthereum.div(100);
      remainingEth = remainingEth.sub(toDivCardHolders);
    }
    /* Next, we tax for dividends:
       Dividends = (ethereum * div%) / 100
       Important note: if we're out of the ICO phase, the 1% sent to div-card holders
                       is handled prior to any dividend taxes are considered. */
    // Grab the user's dividend rate
    uint dividendRate = userDividendRate[msg.sender];
    // Calculate the total dividends on this buy
    dividendAmount = (remainingEth.mul(dividendRate)).div(100);
    remainingEth   = remainingEth.sub(dividendAmount);
    // If we're in the ICO and bankroll is buying, don't tax
    if (icoPhase && msg.sender == bankrollAddress) {
      remainingEth = remainingEth + dividendAmount;
    }
    // Calculate how many tokens to buy:
    tokensBought         = ethereumToTokens_(remainingEth);
    dividendTokensBought = tokensBought.mul(dividendRate);
    // This is where we actually mint tokens:
    tokenSupply    = tokenSupply.add(tokensBought);
    divTokenSupply = divTokenSupply.add(dividendTokensBought);
    /* Update the total investment tracker
       Note that this must be done AFTER we calculate how many tokens are bought -
       because ethereumToTokens needs to know the amount *before* investment, not *after* investment. */
    currentEthInvested = currentEthInvested + remainingEth;
    // If ICO phase, all the dividends go to the bankroll
    if (icoPhase) {
      toBankRoll     = dividendAmount;
      // If the bankroll is buying, we don't want to send eth back to the bankroll
      // Instead, let's just give it the tokens it would get in an infinite recursive buy
      if (msg.sender == bankrollAddress) {
        toBankRoll = 0;
      }
      toReferrer     = 0;
      toTokenHolders = 0;
      /* ethInvestedDuringICO tracks how much Ether goes straight to tokens,
         not how much Ether we get total.
         this is so that our calculation using "investment" is accurate. */
      ethInvestedDuringICO = ethInvestedDuringICO + remainingEth;
      tokensMintedDuringICO = tokensMintedDuringICO + tokensBought;
      // Cannot purchase more than the hard cap during ICO.
      require(ethInvestedDuringICO <= icoHardCap);
      // Contracts aren't allowed to participate in the ICO.
      require(tx.origin == msg.sender || msg.sender == bankrollAddress);
      // Cannot purchase more then the limit per address during the ICO.
      ICOBuyIn[msg.sender] += remainingEth;
      require(ICOBuyIn[msg.sender] <= addressICOLimit || msg.sender == bankrollAddress);
      // Stop the ICO phase if we reach the hard cap
      if (ethInvestedDuringICO == icoHardCap){
        icoPhase = false;
      }
    } else {
      // Not ICO phase, check for referrals
      // 25% goes to referrers, if set
      // toReferrer = (dividends * 25)/100
      if (_referredBy != 0x0000000000000000000000000000000000000000 &&
      _referredBy != msg.sender &&
      frontTokenBalanceLedger_[_referredBy] >= stakingRequirement)
      {
        toReferrer = (dividendAmount.mul(referrer_percentage)).div(100);
        referralBalance_[_referredBy] += toReferrer;
        emit Referral(_referredBy, toReferrer);
      }
      // The rest of the dividends go to token holders
      toTokenHolders = dividendAmount.sub(toReferrer);
      fee = toTokenHolders * magnitude;
      fee = fee - (fee - (dividendTokensBought * (toTokenHolders * magnitude / (divTokenSupply))));
      // Finally, increase the divToken value
      profitPerDivToken       = profitPerDivToken.add((toTokenHolders.mul(magnitude)).div(divTokenSupply));
      payoutsTo_[msg.sender] += (int256) ((profitPerDivToken * dividendTokensBought) - fee);
    }
    // Update the buyer's token amounts
    frontTokenBalanceLedger_[msg.sender] = frontTokenBalanceLedger_[msg.sender].add(tokensBought);
    dividendTokenBalanceLedger_[msg.sender] = dividendTokenBalanceLedger_[msg.sender].add(dividendTokensBought);
    // Transfer to bankroll and div cards
    if (toBankRoll != 0) { ZethrBankroll(bankrollAddress).receiveDividends.value(toBankRoll)(); }
    if (regularPhase) { divCardContract.receiveDividends.value(toDivCardHolders)(dividendRate); }
    // This event should help us track where all the eth is going
    emit Allocation(toBankRoll, toReferrer, toTokenHolders, toDivCardHolders, remainingEth);
    // Sanity checking
    uint sum = toBankRoll + toReferrer + toTokenHolders + toDivCardHolders + remainingEth - _incomingEthereum;
    assert(sum == 0);
  }
}