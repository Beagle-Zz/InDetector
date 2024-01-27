contract c18451{
  // low level token purchase function
  function buyTokens(address beneficiary) payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // calculate token amount to be sent
    uint256 tokens = (weiAmount/10**10) * price;//weiamount * price 
    //bonus schedule
    // if(now < startTime + 1*7*24*60* 1 minutes){//First week
    //   tokens += (tokens * 60) / 100;//60%
    // }else if(now < startTime + 2*7*24*60* 1 minutes){//Second week
    //   tokens += (tokens * 40) / 100;//40%
    // }else if(now < startTime + 3*7*24*60* 1 minutes){//3rd week
    //   tokens += (tokens * 30) / 100;//30% and so on
    // }else if(now < startTime + 4*7*24*60* 1 minutes){
    //   tokens += (tokens * 20) / 100;
    // }else if(now < startTime + 5*7*24*60* 1 minutes){
    //   tokens += (tokens * 10) / 100;
    // }
    if(now<startTime+27*24*60* 1 minutes){
      if(weiAmount>=10**18)
        tokens+=(tokens*60)/100;
      else if(weiAmount>=5*10**17)
        tokens+=(tokens*25)/100;
      else if(weiAmount>=4*10**17)
        tokens+=(tokens*20)/100;
      else if(weiAmount>=3*10**17)
        tokens+=(tokens*15)/100;
      else if(weiAmount>=2*10**17)
        tokens+=(tokens*10)/100;
      else if(weiAmount>=10**17)
        tokens+=(tokens*5)/100;
    }
    // update state
    weiRaised = weiRaised.add(weiAmount);
    tokenReward.transfer(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}