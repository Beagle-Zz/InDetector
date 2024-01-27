contract c7793{
  /**
  * function buyTokens - Collect Ethers and transfer tokens
  */
  function buyTokens(address beneficiary) whenNotPaused public payable {
    require(beneficiary != 0x0);
    require(validPurchase());
    uint256 accessTime = now;
    uint256 tokens = 0;
    uint256 weiAmount = msg.value;
    require((weiAmount >= (100000000000000000)) && (weiAmount <= (20000000000000000000)));
    if ((accessTime >= privateSaleStartTime) && (accessTime < privateSaleEndTime)) {
      tokens = privateSaleTokens(weiAmount, tokens);
    } else {
      revert();
    }
    privateSaleSupply = privateSaleSupply.sub(tokens);
    weiRaised = weiRaised.add(weiAmount);
    token.mint(beneficiary, tokens);
    TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}