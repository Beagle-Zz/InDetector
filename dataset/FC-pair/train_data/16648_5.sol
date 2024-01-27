contract c16648{
  // PUBLIC METHODS TO RETRIEVE DATA IN UI
  // Return Current Jackpot Info
  // [ JackPotBalance, jackpotLastQualified, jackpotLastWinner, jackpotLastPayout,
  //  jackpotCount, gameIndex, gameStartTime, timeTillRoundEnd, roundStartTime]
  function getJackpotInfo() public view returns (uint256, address, address, uint256, uint256, uint256, uint256, uint256, uint256) {
    return (
        jackpotBalance,
        jackpotLastQualified,
        jackpotLastWinner,
        jackpotLastPayout,
        jackpotCount,
        gameIndex,
        gameStartTime,
        lastAction + timeBeforeJackpot,
        roundStartTime
      );
  }
}