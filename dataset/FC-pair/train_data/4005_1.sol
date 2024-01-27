contract c4005{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // calculate token amount to be sent
    uint256 tokens = (weiAmount) * price;//weiamount * price 
    // update state
    weiRaised = weiRaised.add(weiAmount);
    tokenReward.transfer(beneficiary, tokens);
    emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}