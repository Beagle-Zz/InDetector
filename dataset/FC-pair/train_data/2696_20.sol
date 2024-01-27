contract c2696{
  // low level token purchase function
  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());
    uint256 weiAmount = msg.value;
    // calculate token amount to be created
    uint256 tokens = weiAmount.mul(getRate());
    // update state
    weiRaised = weiRaised.add(weiAmount);
    if (tokens > 0) {
      token.mint(beneficiary, tokens);
      emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);      
    }
    forwardFunds();
  }
}