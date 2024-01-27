contract c10237{
  /**
   * @dev distribute ether to every winner as they choosed odds
   */
  function distributeReward(uint winOdds) internal {
    for (uint i = 0; i < players.length; i++) {
      if (playerInfo[players[i]].choice == winChoice) {
        players[i].transfer(winOdds.mul(playerInfo[players[i]].betAmount).div(100));
        LogDistributeReward(players[i], winOdds.mul(playerInfo[players[i]].betAmount).div(100), i);
      }
    }
  }
}