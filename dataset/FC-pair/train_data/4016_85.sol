contract c4016{
  // @dev Get players in the leaderboard.
  function getLeaderboardPlayers()
    external view
    returns (address[])
  {
    return leaderBoardPlayers;
  }
}