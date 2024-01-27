contract c10415{
  /**
   * @dev find a player has participanted or not
   * @param player the address of the participant
   */
  function checkPlayerExists(address player) public view returns (bool) {
    if (playerInfo[player].choice == 0) {
      return false;
    }
    return true;
  }
}