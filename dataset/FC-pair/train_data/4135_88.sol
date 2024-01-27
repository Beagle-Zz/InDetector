contract c4135{
  // @dev Get current number of players in the recently played players queue.
  function getRecentPlayersCount()
    public view
    returns (uint256) 
  {
    return recentPlayersBack - recentPlayersFront;
  }
}