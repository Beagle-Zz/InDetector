contract c4999{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be created
    uint256 tokens = _getTokenAmount(weiAmount);
    _validateTokensAmount(tokens);
    if (currentStage == Stages.Ico1) {
      ico1amount[msg.sender] = ico1amount[msg.sender].add(tokens);
      ico1total = ico1total.add(tokens);
    } else if (currentStage == Stages.Ico2) {
      ico2amount[msg.sender] = ico2amount[msg.sender].add(tokens);
      ico2total = ico2total.add(tokens);
    } else if (currentStage == Stages.Ico3) {
      ico3amount[msg.sender] = ico3amount[msg.sender].add(tokens);
      ico3total = ico3total.add(tokens);
    }
    weiRaised = weiRaised.add(weiAmount);
    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
    _forwardFunds(weiAmount);
  }
}