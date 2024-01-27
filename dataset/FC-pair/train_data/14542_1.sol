contract c14542{
  // low level token purchase function
  function buyTokens(address beneficiary) payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // calculate token amount to be sent
    uint256 tokens = (weiAmount/10**10) * 3000;
    if(now < startTime + 1*7*24*60* 1 minutes){
      tokens += (tokens * 20) / 100;
    }else if(now < startTime + 2*7*24*60* 1 minutes){
      tokens += (tokens * 10) / 100;
    }else{
      tokens += (tokens * 5) / 100;
    }
    // update state
    weiRaised = weiRaised.add(weiAmount);
    tokenReward.transfer(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}