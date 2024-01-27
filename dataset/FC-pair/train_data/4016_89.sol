contract c4016{
  // @dev Update record.
  function updateRecord(address _myAddress, address _enemyAddress, bool _didWin)
    whenNotPaused onlyAccessDeploy
    public
  {
    address _winnerAddress = _didWin? _myAddress: _enemyAddress;
    address _loserAddress = _didWin? _enemyAddress: _myAddress;
    // Initial value of Elo.
    uint32 _winnerElo = addressToElo[_winnerAddress];
    if (_winnerElo == 0)
      _winnerElo = 1500;
    uint32 _loserElo = addressToElo[_loserAddress];
    if (_loserElo == 0)
      _loserElo = 1500;
    // Adjust Elo.
    if (_winnerElo >= _loserElo) {
      if (_winnerElo - _loserElo < 50) {
        addressToElo[_winnerAddress] = _winnerElo + 5;
        addressToElo[_loserAddress] = _loserElo - 5;
      } else if (_winnerElo - _loserElo < 80) {
        addressToElo[_winnerAddress] = _winnerElo + 4;
        addressToElo[_loserAddress] = _loserElo - 4;
      } else if (_winnerElo - _loserElo < 150) {
        addressToElo[_winnerAddress] = _winnerElo + 3;
        addressToElo[_loserAddress] = _loserElo - 3;
      } else if (_winnerElo - _loserElo < 250) {
        addressToElo[_winnerAddress] = _winnerElo + 2;
        addressToElo[_loserAddress] = _loserElo - 2;
      } else {
        addressToElo[_winnerAddress] = _winnerElo + 1;
        addressToElo[_loserAddress] = _loserElo - 1;
      }
    } else {
      if (_loserElo - _winnerElo < 50) {
        addressToElo[_winnerAddress] = _winnerElo + 5;
        addressToElo[_loserAddress] = _loserElo - 5;
      } else if (_loserElo - _winnerElo < 80) {
        addressToElo[_winnerAddress] = _winnerElo + 6;
        addressToElo[_loserAddress] = _loserElo - 6;
      } else if (_loserElo - _winnerElo < 150) {
        addressToElo[_winnerAddress] = _winnerElo + 7;
        addressToElo[_loserAddress] = _loserElo - 7;
      } else if (_loserElo - _winnerElo < 250) {
        addressToElo[_winnerAddress] = _winnerElo + 8;
        addressToElo[_loserAddress] = _loserElo - 8;
      } else {
        addressToElo[_winnerAddress] = _winnerElo + 9;
        addressToElo[_loserAddress] = _loserElo - 9;
      }
    }
    // Update recent players list.
    if (!isPlayerInQueue(_myAddress)) {
      // If the queue is full, pop a player.
      if (getRecentPlayersCount() >= numberOfRecentPlayers)
        popPlayer();
      // Push _myAddress to the queue.
      pushPlayer(_myAddress);
    }
    // Update leaderboards.
    if(updateLeaderboard(_enemyAddress) || updateLeaderboard(_myAddress))
    {
      UpdateLeaderboard(_myAddress, now);
    }
  }
}