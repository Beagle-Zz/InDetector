contract c3686{
  /**
   * @dev Finalizes the public sale
   *
   */
  function finalizeSale() atStage(Stages.MAINSALE) internal {
    mainSale_EndDate = now;
    require(SolidToken(token).setTransferEnablingDate(now + TOKEN_RELEASE_DELAY));
    currentStage = Stages.FINALIZED;
  }
}