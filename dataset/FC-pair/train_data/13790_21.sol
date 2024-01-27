contract c13790{
  // low level token Pledge function
  function procureTokens(address beneficiary) public payable {
    uint256 tokens;
    uint256 weiAmount = msg.value;
    uint256 backAmount;
    uint256 rate;
    uint hardCap;
    require(beneficiary != address(0));
    rate = getRateIcoWithBonus();
    //icoPreICO   
    hardCap = hardcapPreICO;
    if (now >= startIcoPreICO && now < endIcoPreICO && totalSoldTokens < hardCap){
	  require(weiAmount >= minPurchasePreICO);
      tokens = weiAmount.mul(rate);
      if (hardCap.sub(totalSoldTokens) < tokens){
        tokens = hardCap.sub(totalSoldTokens); 
        weiAmount = tokens.div(rate);
        backAmount = msg.value.sub(weiAmount);
      }
    }  
    //icoMainSale  
    hardCap = hardcapMainSale.add(hardcapPreICO);
    if (now >= startIcoMainSale  && now < endIcoMainSale  && totalSoldTokens < hardCap){
      tokens = weiAmount.mul(rate);
      if (hardCap.sub(totalSoldTokens) < tokens){
        tokens = hardCap.sub(totalSoldTokens); 
        weiAmount = tokens.div(rate);
        backAmount = msg.value.sub(weiAmount);
      }
    }     
    require(tokens > 0);
    totalSoldTokens = totalSoldTokens.add(tokens);
    balances[msg.sender] = balances[msg.sender].add(weiAmount);
    token.mint(msg.sender, tokens);
	unconfirmedSum = unconfirmedSum.add(tokens);
	unconfirmedSumAddr[msg.sender] = unconfirmedSumAddr[msg.sender].add(tokens);
	token.SetPermissionsList(beneficiary, 1);
    if (backAmount > 0){
      msg.sender.transfer(backAmount);    
    }
    emit TokenProcurement(msg.sender, beneficiary, weiAmount, tokens);
  }
}