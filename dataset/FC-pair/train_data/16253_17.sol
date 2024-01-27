contract c16253{
  // low level token Pledge function
  function procureTokens(address beneficiary) public payable {
    uint256 tokens;
    uint256 weiAmount = msg.value;
    uint256 backAmount;
    require(beneficiary != address(0));
    //ico   
    if (now >= startIco && now < endIco && totalSoldTokens < hardcap){
      tokens = weiAmount.mul(rateIco);
      if (hardcap.sub(totalSoldTokens) < tokens){
        tokens = hardcap.sub(totalSoldTokens); 
        weiAmount = tokens.div(rateIco);
        backAmount = msg.value.sub(weiAmount);
      }
      totalSoldTokens = totalSoldTokens.add(tokens);
    }        
    require(tokens > 0);
    balances[msg.sender] = balances[msg.sender].add(msg.value);
    token.mint(msg.sender, tokens);
    if (backAmount > 0){
      balances[msg.sender] = balances[msg.sender].sub(backAmount);         
      msg.sender.transfer(backAmount);    
    }
    emit TokenProcurement(msg.sender, beneficiary, weiAmount, tokens);
  }
}