contract c10036{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(isCrowdsalePaused == false);
    require(validPurchase());
    require(TOKENS_SOLD<maxTokensToSale);
    uint256 weiAmount = msg.value.div(10**16);
    uint256 tokens = calculateTokens(weiAmount);
    // update state
    weiRaised = weiRaised.add(msg.value);
    token.transfer(beneficiary,tokens);
    emit TokenPurchase(owner, beneficiary, msg.value, tokens);
    TOKENS_SOLD = TOKENS_SOLD.add(tokens);
    distributeFunds();
  }
}