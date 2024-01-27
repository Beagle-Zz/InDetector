contract c10237{
  /**
   * @dev get basic information of this bet
   */
  function getBetInfo() public view returns (bytes32, bytes32, uint8, uint8, uint16, uint16, uint16, uint, uint, uint, address) {
    return (betInfo.category, betInfo.gameId, betInfo.spread, betInfo.flag, betInfo.leftOdds, betInfo.middleOdds,
            betInfo.rightOdds, betInfo.minimumBet, betInfo.startTime, betInfo.deposit, betInfo.dealer);
  }
}