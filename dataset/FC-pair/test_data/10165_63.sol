contract c10165{
  /**
   * @notice if period is on sale, return index of the period.
   */
  function getStageIndex() public view returns (uint8 currentStage, bool onSale) {
    onSale = true;
    Stage memory p;
    for (currentStage = 0; currentStage < stages.length; currentStage++) {
      p = stages[currentStage];
      if (p.startTime <= now && now <= p.endTime) {
        return;
      }
    }
    onSale = false;
  }
}