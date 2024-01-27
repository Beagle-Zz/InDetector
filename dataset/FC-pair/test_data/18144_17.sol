contract c18144{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    require(now >= startICO); 
    require(msg.value <= maxEther);
    require(allTokenICO <= maxTokens);
    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be created
    uint256 tokens = _getTokenAmount(weiAmount);
    // update state
    weiRaised = weiRaised.add(weiAmount);
    _processPurchase(_beneficiary, tokens);
    // update state
    allTokenICO = allTokenICO.add(tokens);
    emit TokenPurchase(
      msg.sender,
      _beneficiary,
      weiAmount,
      tokens
    );
    _forwardFunds();
  }
}