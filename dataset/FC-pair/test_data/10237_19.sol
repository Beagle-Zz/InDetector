contract c10237{
  /**
   * @dev closeBet could be called by everyone, but owner/dealer should to this.
   */
  function closeBet() external {
    require(!isBetClosed);
    (leftPts, rightPts, confirmations) = dataCenterGetResult(betInfo.gameId);
    require(confirmations >= neededConfirmations);
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