contract c3686{
  /**
   * @dev Override to extend the way in which ether is converted to tokens.
   * @param _weiAmount Value in wei to be converted into tokens
   * @return Number of tokens that can be purchased with the specified _weiAmount
   */
  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256 amount) {
    amount = (_weiAmount.sub(changeDue)).mul(HUNDRED_PERCENT).div(rate); // Multiplication to account for the decimal cases in the rate
    if(currentStage == Stages.BONUSSALE){
      amount = amount.add(amount.mul(BONUS_PERCENT).div(HUNDRED_PERCENT)); //Add bonus
    }
  }
}