contract c7806{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(isCrowdsalePaused == false);
    require(validPurchase());
    require(TOKENS_SOLD<maxTokensToSale);
    uint256 weiAmount = msg.value;
    uint256 tokens=0;
    // calculate token amount to be created
    if(TOKENS_SOLD<=5000000*10**18)
    {
        tokens = weiAmount.mul(ratePerEthPhase1);
    }
    else if(TOKENS_SOLD>5000000*10**18 && TOKENS_SOLD<=15000000*10**18)
    {
        tokens = weiAmount.mul(ratePerEthPhase2);
    }
    else if(TOKENS_SOLD>15000000*10**18 && TOKENS_SOLD<=51000000*10**18)
    {
        tokens = weiAmount.mul(ratePerEthPhase3);
    }
    else
    {
        revert();
    }
    // update state
    weiRaised = weiRaised.add(weiAmount);
    token.transfer(beneficiary,tokens);
    emit TokenPurchase(owner, beneficiary, weiAmount, tokens);
    TOKENS_SOLD = TOKENS_SOLD.add(tokens);
    forwardFunds();
  }
}