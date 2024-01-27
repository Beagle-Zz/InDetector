contract c3686{
  /**
   * @dev Finalizes the bonussale and sets up the break and public sales
   *
   */
  function finalizePresale() atStage(Stages.BONUSSALE) internal{
    bonussale_EndDate = now;
    mainSale_StartDate = now;
    mainSale_EndDate = mainSale_StartDate + MAINSALE_MAX_DURATION;
    mainSale_TokenCap = mainSale_TokenCap.add(bonussale_TokenCap.sub(bonussale_TokesSold));
    mainSale_Cap = mainSale_Cap.add(bonussale_Cap.sub(weiRaised.sub(changeDue)));
    currentStage = Stages.MAINSALE;
  }
}