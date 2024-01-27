contract c10237{
  /**
   * @dev manualCloseBet could only be called by owner,
   *      this method only be used for ropsten,
   *      when ethereum-events-data deployed,
   *      game result should not be upload by owner
   */
  function manualCloseBet(uint16 _leftPts, uint16 _rightPts) onlyOwner external {
    require(!isBetClosed);
    leftPts = _leftPts;
    rightPts = _rightPts;
    LogGameResult(betInfo.category, betInfo.gameId, leftPts, rightPts);
    winChoice = getWinChoice(leftPts, rightPts);
    if (winChoice == 1) {
      distributeReward(betInfo.leftOdds);
    } else if (winChoice == 2) {
      distributeReward(betInfo.middleOdds);
    } else {
      distributeReward(betInfo.rightOdds);
    }
    isBetClosed = true;
    LogBetClosed(false, now);
    withdraw();
  }
}