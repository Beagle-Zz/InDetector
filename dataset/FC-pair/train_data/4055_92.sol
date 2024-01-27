contract c4055{
  // @dev Push a new player into the queue.
  function pushPlayer(address _player)
    private
  {
    recentPlayers.push(_player);
    recentPlayersBack++;
  }
}