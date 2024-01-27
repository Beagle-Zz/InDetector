contract c3291{
  // MAIN BUYING Function
  function buyTokens(address purchaser, uint256 value) internal  whenNotPaused returns(uint256) {
    require(value > 0);
    Stage stage = getStage();
    require(stage == Stage.Presale || stage == Stage.PublicSale);
    //the purchase amount cannot be more than the whitelisted cap
    uint256 purchaseAmount = Math.min256(value, investorCaps[purchaser].sub(contributions[purchaser]));
    require(purchaseAmount > 0);
    uint256 numTokens;
    //call the presale contract
    if (stage == Stage.Presale) {
      if (Presale.totalWei().add(purchaseAmount) > Presale.totalCap()) {
        purchaseAmount = Presale.capRemaining();
      }
      numTokens = Presale.buyTokens(purchaser, purchaseAmount);
    } else if (stage == Stage.PublicSale) {
      uint totalWei = weiRaised.add(purchaseAmount);
      uint8 currentTier = getTier(weiRaised); //get current tier
      if (totalWei >= cap) { // will TOTAL_CAP(HARD_CAP) of the public sale be reached ?
        totalWei = cap;
        //purchase amount can be only be (CAP - WeiRaised)
        purchaseAmount = cap.sub(weiRaised);
      }
      // if the totalWei( weiRaised + msg.value) fits within current cap
      // number of tokens would be rate * purchaseAmount
      if (totalWei <= tiers[currentTier].max) {
        numTokens = purchaseAmount.mul(tiers[currentTier].rate);
      } else {
        //wei remaining in the current tier
        uint remaining = tiers[currentTier].max.sub(weiRaised);
        numTokens = remaining.mul(tiers[currentTier].rate);
        //wei in the next tier
        uint256 excess = totalWei.sub(tiers[currentTier].max);
        //number of tokens  = wei remaining in the next tier * rate of the next tier
        numTokens = numTokens.add(excess.mul(tiers[currentTier + 1].rate));
      }
      // update the total raised so far
      weiRaised = weiRaised.add(purchaseAmount);
    }
    // total tokens sold in the entire sale
    require(tokensSold.add(numTokens) <= publicTokensAvailable);
    tokensSold = tokensSold.add(numTokens);
    // forward funds to the wallet
    forwardFunds(purchaser, purchaseAmount);
    // transfer the tokens to the purchaser
    transferTokens(purchaser, numTokens);
    // return the remaining unused wei back
    if (value.sub(purchaseAmount) > 0) {
      msg.sender.transfer(value.sub(purchaseAmount));
    }
    //event
    TokenPurchase(purchaser, numTokens, purchaseAmount);
    return numTokens;
  }
}