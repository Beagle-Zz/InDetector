contract c4016{
  // #dev Check whether contain the element or not.
  function isPlayerInQueue(address _player)
    view private
    returns (bool isContain)
  {
    isContain = false;
    for (uint256 i = recentPlayersFront; i < recentPlayersBack; i++) {
      if (_player == recentPlayers[i]) {
        isContain = true;
      }
    }
  }
}