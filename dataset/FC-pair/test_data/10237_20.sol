contract c10237{
  /**
   * @dev get the players
   */
  function getPlayers() view public returns (address[]) {
    return players;
  }
}