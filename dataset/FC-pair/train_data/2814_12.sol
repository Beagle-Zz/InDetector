contract c2814{
// ----------------------------------------------------------------------------
// function for front-end token purchase on our website ***DO NOT OVERRIDE***
// buyer = Address of the wallet performing the token purchase
// ----------------------------------------------------------------------------
  function buyTokens(address buyer) public payable {
    // check Crowdsale is open (can disable for testing)
    require(openingTime <= block.timestamp);
    require(block.timestamp < closingTime);
    // minimum purchase of 100 tokens (0.1 eth)
    require(msg.value >= minSpend);
    // maximum purchase per transaction to allow broader
    // token distribution during tokensale
    require(msg.value <= maxSpend);
    // stop sales of tokens if token balance is 0
    require(tokenSaleTokenBalance() > 0);
    // stop sales of tokens if Token sale is paused
    require(tokenSaleIsPaused == false);
    // log the amount being sent
    uint256 weiAmount = msg.value;
    preValidatePurchase(buyer, weiAmount);
    // calculate token amount to be sold
    uint256 tokens = getTokenAmount(weiAmount);
    // check that the amount of eth being sent by the buyer 
    // does not exceed the equivalent number of tokens remaining
    require(tokens <= tokenSaleTokenBalance());
    // update state
    weiRaised = weiRaised.add(weiAmount);
    processPurchase(buyer, tokens);
    emit TokenPurchase(
      msg.sender,
      buyer,
      weiAmount,
      tokens
    );
    updatePurchasingState(buyer, weiAmount);
    forwardFunds();
    postValidatePurchase(buyer, weiAmount);
  }
}