contract c4016{
  // @dev Pop the oldest player in this queue.
  function popPlayer() 
    private
    returns (address player)
  {
    if (recentPlayersBack == recentPlayersFront)
      return address(0);
    player = recentPlayers[recentPlayersFront];
    delete recentPlayers[recentPlayersFront];
    recentPlayersFront++;
  }
}