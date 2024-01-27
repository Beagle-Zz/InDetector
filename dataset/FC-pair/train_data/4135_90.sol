contract c4135{
  // @dev Update leaderboard.
  function updateLeaderboard(address _addressToUpdate)
    whenNotPaused
    private
    returns (bool isChanged)
  {
    // If this players is already in the leaderboard, there's no need for replace the minimum recorded player.
    if (addressToIsInLeaderboard[_addressToUpdate]) {
      // Do nothing.
    } else {
      if (leaderBoardPlayers.length >= numberOfLeaderboardPlayers) {
        // Need to replace existing player.
        // First, we need to find the player with miminum Elo value.
        uint32 _minimumElo = 99999;
        uint8 _minimumEloPlayerIndex = numberOfLeaderboardPlayers;
        for (uint8 i = 0; i < leaderBoardPlayers.length; i ++) {
          if (_minimumElo > addressToElo[leaderBoardPlayers[i]]) {
            _minimumElo = addressToElo[leaderBoardPlayers[i]];
            _minimumEloPlayerIndex = i;
          }
        }
        // Second, if the minimum elo value is smaller than the player's elo value, then replace the entity.
        if (_minimumElo <= addressToElo[_addressToUpdate]) {
          leaderBoardPlayers[_minimumEloPlayerIndex] = _addressToUpdate;
          addressToIsInLeaderboard[_addressToUpdate] = true;
          addressToIsInLeaderboard[leaderBoardPlayers[_minimumEloPlayerIndex]] = false;
          isChanged = true;
        }
      } else {
        // The list is not full yet. 
        // Just add the player to the list.
        leaderBoardPlayers.push(_addressToUpdate);
        addressToIsInLeaderboard[_addressToUpdate] = true;
        isChanged = true;
      }
    }
  }
}