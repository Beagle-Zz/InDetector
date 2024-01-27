contract c12120{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    uint256 tokens;
    uint256 weiAmount = msg.value;
    uint256 backAmount;
    require(beneficiary != address(0));
    //minimum amount in ETH
    require(weiAmount >= minQuanValues);
    if (now >= startPreICO && now < endPreICO && totalPreICOAmount < maxAmountPreICO && tokens == 0){
      tokens = weiAmount.div(100).mul(ratePreICO);
      if (maxAmountPreICO.sub(totalPreICOAmount) < tokens){
        tokens = maxAmountPreICO.sub(totalPreICOAmount); 
        weiAmount = tokens.mul(100).div(ratePreICO);
        backAmount = msg.value.sub(weiAmount);
      }
      totalPreICOAmount = totalPreICOAmount.add(tokens);
      if (totalPreICOAmount >= maxAmountPreICO){
        startICO = now;
        endICO = startICO + 30 * 1 days;
      }   
    }    
    if (now >= startICO && totalICOAmount < maxAmountICO  && tokens == 0){
      tokens = weiAmount.div(100).mul(rateICO);
      if (maxAmountICO.sub(totalICOAmount) < tokens){
        tokens = maxAmountICO.sub(totalICOAmount); 
        weiAmount = tokens.mul(100).div(rateICO);
        backAmount = msg.value.sub(weiAmount);
      }
      totalICOAmount = totalICOAmount.add(tokens);
    }     
    require(tokens > 0);
    token.mint(beneficiary, tokens);
    wallet.transfer(weiAmount);
    if (backAmount > 0){
      msg.sender.transfer(backAmount);    
    }
    emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
  }
}