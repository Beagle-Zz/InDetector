contract c352{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) payable public{
    uint256 weiAmount = msg.value;
    if (checksOn) {
        _preValidatePurchase(_beneficiary, weiAmount);
    }
    // calculate token amount to be created
    uint256 tokens = _getTokenAmount(weiAmount);
    // update state
    tokensRaised = tokensRaised.add(tokens);
    minterContract.mint(_beneficiary, tokens);
    emit TokenPurchase(
      msg.sender,
      _beneficiary,
      weiAmount,
      tokens
    );
    _forwardFunds();
  }
}