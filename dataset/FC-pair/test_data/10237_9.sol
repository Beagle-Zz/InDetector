contract c10237{
  /**
   * @dev get basic information of this bet
   *
   *  uint public numberOfBet;
   *  uint public totalBetAmount = 0;
   *  uint public leftAmount;
   *  uint public middleAmount;
   *  uint public rightAmount;
   *  uint public deposit;
   */
  function getBetMutableData() public view returns (uint, uint, uint, uint, uint, uint) {
    return (numberOfBet, totalBetAmount, leftAmount, middleAmount, rightAmount, betInfo.deposit);
  }
}