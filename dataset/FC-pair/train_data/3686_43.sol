contract c3686{
  /**
    @dev Execute automatically transitions between different Stages
    based on time only
  **/
  modifier timedTransition(){
    if(currentStage == Stages.READY && now >= bonussale_StartDate){
      currentStage = Stages.BONUSSALE;
    }
    if(currentStage == Stages.BONUSSALE && now > bonussale_EndDate){
      finalizePresale();
    }
    if(currentStage == Stages.MAINSALE && now > mainSale_EndDate){
      finalizeSale();
    }
    _;
  }
}