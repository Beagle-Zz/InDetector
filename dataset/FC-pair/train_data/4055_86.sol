contract c4055{
  // @dev Get current length of the leaderboard.
  function getLeaderboardLength()
    external view
    returns (uint256)
  {
    return leaderBoardPlayers.length;
  }
}