contract c10237{
  /**
   * @dev if there are some reasons lead game postpone or cancel
   *      the bet will also cancel and refund every bet
   */
  function refund() onlyOwner public {
    for (uint i = 0; i < players.length; i++) {
      players[i].transfer(playerInfo[players[i]].betAmount);
      LogRefund(players[i], playerInfo[players[i]].betAmount);
    }
    isBetClosed = true;
    LogBetClosed(true, now);
    withdraw();
  }
}