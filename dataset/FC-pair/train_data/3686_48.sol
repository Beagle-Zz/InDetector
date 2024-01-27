contract c3686{
  /**
    FINALIZATION RELATES FUNCTIONS
  **/
  /**
   * @dev Checks and distribute the remaining tokens. Finish minting afterwards
   * @return uint256 representing the cap
   */
  function distributeTokens() public onlyOwner atStage(Stages.FINALIZED) {
    require(!distributed);
    distributed = true;
    uint256 totalTokens = (bonussale_TokesSold.add(mainSale_TokesSold)).mul(HUNDRED_PERCENT).div(TOKENS_ON_SALE_PERCENT); //sold token will represent 60% of all tokens
    for(uint i = 0; i < partners.length; i++){
      uint256 amount = percentages[partners[i]].mul(totalTokens).div(HUNDRED_PERCENT);
      _deliverTokens(partners[i], amount);
    }
    for(uint j = 0; j < partnerFixedAmount.length; j++){
      _deliverTokens(partnerFixedAmount[j], fixedAmounts[partnerFixedAmount[j]]);
    }
    require(SolidToken(token).finishMinting());
  }
}