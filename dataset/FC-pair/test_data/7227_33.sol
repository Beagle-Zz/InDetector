contract c7227{
  // overriding Crowdsale#buyTokens to add pausable sales and vip logic
  function buyTokens(address beneficiary) public whenNotPaused payable {
    require(beneficiary != address(0));
    require(!isFinalized);
    uint256 weiAmount = msg.value;
    uint tokens;
    if(vip[msg.sender] == true){
      tokens = weiAmount.mul(vipRate);
    }else{
      tokens = weiAmount.mul(rate);
    }
    require(validPurchase(tokens));
    soldTokens = soldTokens.add(tokens);
    // update state
    weiRaised = weiRaised.add(weiAmount);
    token.mint(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}