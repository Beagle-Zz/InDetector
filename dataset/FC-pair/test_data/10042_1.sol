contract c10042{
  // low level token purchase function
  function buyTokens(address beneficiary) payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // if(weiAmount < 10**16) throw;
    // if(weiAmount > 50*10**18) throw;
    // calculate token amount to be sent
    uint256 tokens = (weiAmount) * price;//weiamount * price 
    // uint256 tokens = (weiAmount/10**(18-decimals)) * price;//weiamount * price 
    // update state
    weiRaised = weiRaised.add(weiAmount);
    // if(contributions[msg.sender].add(weiAmount)>10*10**18) throw;
    // contributions[msg.sender] = contributions[msg.sender].add(weiAmount);
    tokenReward.transfer(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}