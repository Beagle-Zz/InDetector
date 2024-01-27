contract c3686{
  /**
   * @dev Override for extensions that require an internal state to check for validity (current user contributions, etc.)
   * @param _beneficiary Address receiving the tokens
   * @param _weiAmount Value in wei involved in the purchase
   */
  function _updatePurchasingState(address _beneficiary, uint256 _weiAmount) internal {
    uint256 tokenAmount = _getTokenAmount(_weiAmount);
    if(currentStage == Stages.BONUSSALE){
      bonussale_TokesSold = bonussale_TokesSold.add(tokenAmount);
      bonussale_WeiRaised = bonussale_WeiRaised.add(_weiAmount.sub(changeDue));
    } else {
      mainSale_TokesSold = mainSale_TokesSold.add(tokenAmount);
      mainSale_WeiRaised = mainSale_WeiRaised.add(_weiAmount.sub(changeDue));
    }
    contributions[_beneficiary] = contributions[_beneficiary].add(_weiAmount).sub(changeDue);
    weiRaised = weiRaised.sub(changeDue);
  }
}