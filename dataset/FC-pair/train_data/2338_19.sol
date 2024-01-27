contract c2338{
  /**
   * @dev low level token purchase ***DO NOT OVERRIDE***
   * @param _beneficiary Address performing the token purchase
   */
  function buyTokens(address _beneficiary) public payable {
    uint256 weiAmount = msg.value;
    _preValidatePurchase(_beneficiary, weiAmount);
    // calculate token amount to be created
    (uint256 tokens, uint256 left) = _getTokenAmount(weiAmount);
    uint256 weiEarned = weiAmount.sub(left);
    uint256 bonus = _getBonus(tokens);
    uint256 withBonus = tokens.add(bonus);
    if (left > 0) {
      _beneficiary.send(left);
    }
    // update state
    weiRaised = weiRaised.add(weiEarned);
    _processPurchase(_beneficiary, withBonus);
    emit Purchase(
      _beneficiary,
      address(0),
        weiEarned,
      tokens,
      bonus,
      ""
    );
    _updatePurchasingState(_beneficiary, weiEarned, withBonus);
    _postValidatePurchase(_beneficiary, weiEarned);
  }
}