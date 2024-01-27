contract c7464{
  /**
   * @dev Executed when a purchase has been validated and is ready to be executed. Not necessarily emits/sends tokens.
   * It computes the bonus and store it using the timelockController.
   * @param _beneficiary Address receiving the tokens
   * @param _tokenAmount Number of tokens to be purchased
   */
  function _processPurchase( address _beneficiary, uint256 _tokenAmount ) internal {
    uint256 _totalTokens = _tokenAmount;
    // solium-disable-next-line security/no-block-members
    uint256 _bonus = getBonus(block.timestamp, _beneficiary, msg.value);
    if (_bonus>0) {
      uint256 _bonusTokens = _tokenAmount.mul(_bonus).div(100);
      // make sure the crowdsale contract has enough tokens to transfer the purchased tokens and to create the timelock bonus.
      uint256 _currentBalance = token.balanceOf(this);
      require(_currentBalance >= _totalTokens.add(_bonusTokens));
      bonuses[_beneficiary] = bonuses[_beneficiary].add(_bonusTokens);
      _totalTokens = _totalTokens.add(_bonusTokens);
    }
    tokensToBeDelivered = tokensToBeDelivered.add(_totalTokens);
    super._processPurchase(_beneficiary, _tokenAmount);
  }
}