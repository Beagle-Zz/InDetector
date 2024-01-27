contract c18574{
  // low level token Pledge function
  function procureTokens(address beneficiary) public payable {
    uint256 tokens;
    uint256 weiAmount = msg.value;
    uint256 backAmount;
    require(beneficiary != address(0));
    //minimum amount in ETH
    require(weiAmount >= minQuanValues);
    //maximum amount in ETH
    require(weiAmount.add(balances[msg.sender]) <= maxQuanValues);    
    //hard cap
    address _this = this;
    require(hardcap > _this.balance);
    //Pre-sale
    if (now >= startPreSale && now < endPreSale && totalPreSale < maxPreSale){
      tokens = weiAmount.mul(ratePreSale);
	  if (maxPreSale.sub(totalPreSale) <= tokens){
	    endPreSale = now;
	    startIco = now;
	    endIco = startIco + 40 * 1 days; 
	  }
      if (maxPreSale.sub(totalPreSale) < tokens){
        tokens = maxPreSale.sub(totalPreSale); 
        weiAmount = tokens.div(ratePreSale);
        backAmount = msg.value.sub(weiAmount);
      }
      totalPreSale = totalPreSale.add(tokens);
    }
    //ico   
    if (now >= startIco && now < endIco && totalIco < maxIco){
      tokens = weiAmount.mul(rateIco);
      if (maxIco.sub(totalIco) < tokens){
        tokens = maxIco.sub(totalIco); 
        weiAmount = tokens.div(rateIco);
        backAmount = msg.value.sub(weiAmount);
      }
      totalIco = totalIco.add(tokens);
    }        
    require(tokens > 0);
    balances[msg.sender] = balances[msg.sender].add(msg.value);
    token.transfer(msg.sender, tokens);
   // balancesToken[msg.sender] = balancesToken[msg.sender].add(tokens);
    if (backAmount > 0){
      msg.sender.transfer(backAmount);    
    }
    emit TokenProcurement(msg.sender, beneficiary, weiAmount, tokens);
  }
}