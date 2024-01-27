contract c16969{
  // low level token purchase function
 function buyTokens(address beneficiary) public payable {
 require(beneficiary != 0x0);
 require(validPurchase());
 require(msg.value >= 0.05 ether);
 uint256 weiAmount = msg.value;
 uint256 updateWeiRaised = weiRaised.add(weiAmount);
 uint256 rate = getRate();
 uint256 tokens = weiAmount.mul(rate);
 require ( tokens <= token.balanceOf(this));
// update state
weiRaised = updateWeiRaised;
token.transfer(beneficiary, tokens);
tokensSold = tokensSold.add(tokens);
emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
forwardFunds();
}
}