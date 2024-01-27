contract c249{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    uint256 weiAmount = msg.value;
    uint8 stageIndex = _getStageIndex();
    require(stageIndex > 0);
    require(stageIndex <= 8);
    _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be created
    uint256 tokens = _getTokenAmount(weiAmount, stageIndex);
    // update state
    weiRaised = weiRaised.add(weiAmount);
    contributions[msg.sender] = contributions[msg.sender].add(weiAmount);
    if (stageIndex == 1 || stageIndex == 2) round1Sold = round1Sold.add(tokens);
    else if (stageIndex == 3 || stageIndex == 4) round2Sold = round2Sold.add(tokens);
    else if (stageIndex == 5 || stageIndex == 6) round3Sold = round3Sold.add(tokens);
    else round4Sold = round4Sold.add(tokens);
    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(
      msg.sender,
      _beneficiary,
      weiAmount,
      tokens
    );
    if (weiRaised >= softCap) _forwardFunds();
  }
}