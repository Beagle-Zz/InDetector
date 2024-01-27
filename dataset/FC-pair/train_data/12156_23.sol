contract c12156{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be created
    uint256 tokens = _getTokenAmount(weiAmount);
    // update state
    weiRaised = weiRaised.add(weiAmount);
    _processPurchase(_beneficiary, tokens);
    emit TokenPurchase(msg.sender, _beneficiary, weiAmount, tokens);
    _updatePurchasingState(_beneficiary, weiAmount);
    _forwardFunds();
    _postValidatePurchase(_beneficiary, weiAmount);
  }
}