contract c8297{
  /**
   * @dev Validation of the capped restrictions.
   * @param _tokens tokens amount
   */
  function _validateTokensLimits(uint256 _tokens) internal {
    if (currentStage == Stages.Private) {
      privateTokensSold = privateTokensSold.add(_tokens);
      require(privateTokensSold <= privateCap);
    } else if(currentStage == Stages.PreIco) {
      preIcoTokensSold = preIcoTokensSold.add(_tokens);
      require(preIcoTokensSold <= preIcoCap);
    } else if(currentStage == Stages.Ico) {
      icoTokensSold = icoTokensSold.add(_tokens);
      require(icoTokensSold <= icoCap);
    } else {
      revert();
    }
  }
}