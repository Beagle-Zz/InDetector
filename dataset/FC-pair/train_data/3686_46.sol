contract c3686{
  /**
   * @dev Returns de ETH cap of the current currentStage
   * @return uint256 representing the raised amount in the stage
   */
  function getRaisedForCurrentStage() public view returns(uint256 raised){
    raised = bonussale_WeiRaised;
    if(currentStage == Stages.MAINSALE)
      raised = mainSale_WeiRaised;
  }
}