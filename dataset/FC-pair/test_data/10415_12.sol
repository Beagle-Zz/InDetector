contract c10415{
  /**
   * @dev get player bet information
   * @param addr indicate the bet address
   */
  function getPlayerBetInfo(address addr) view public returns (uint, uint) {
    return (playerInfo[addr].choice, playerInfo[addr].betAmount);
  }
}