contract c3686{
  /**
      STAGE RELATED FUNCTIONS
  **/
  /**
   * @dev Returns de ETH cap of the current currentStage
   * @return uint256 representing the cap
   */
  function getCurrentCap() public view returns(uint256 cap){
    cap = bonussale_Cap;
    if(currentStage == Stages.MAINSALE){
      cap = mainSale_Cap;
    }
  }
}