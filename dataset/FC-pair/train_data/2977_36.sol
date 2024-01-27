contract c2977{
  /**
   * Low level token purchase function
   * @param _beneficiary will receive the tokens.
   */
  function buyTokens(address _beneficiary) public payable whenNotPaused whenNotFinalized {
    require(_beneficiary != 0x0);
    require(validPurchase());
    uint256 weiAmount = msg.value;
    require(weiAmount >= MIN_PURCHASE_OTHERSALES && weiAmount <= MAX_PURCHASE);
    uint256 priceInWei = ICO_BASE_PRICE_IN_WEI;
    totalWeiRaised = totalWeiRaised.add(weiAmount);
    uint256 bonusPercentage = determineBonus(weiAmount);
    uint256 bonusTokens;
    uint256 initialTokens = weiAmount.mul(DECIMALS_MULTIPLIER).div(priceInWei);
    if(bonusPercentage>0){
      uint256 initialDivided = initialTokens.div(100);
      bonusTokens = initialDivided.mul(bonusPercentage);
    } else {
      bonusTokens = 0;
    }
    uint256 tokens = initialTokens.add(bonusTokens);
    tokensMinted = tokensMinted.add(tokens);
    require(tokensMinted < cap);
    contributors = contributors.add(1);
    ledToken.mint(_beneficiary, tokens);
    emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
    forwardFunds();
  }
}