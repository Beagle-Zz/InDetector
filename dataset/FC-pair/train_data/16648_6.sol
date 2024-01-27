contract c16648{
  // Return player game info based on game index and player address
  // [ totalInvested, totalValue, totalPaidOut]
  function getPlayerGameInfo(uint256 _gameIndex, address _player) public view returns (uint256, uint256, uint256) {
    return (
        games[_gameIndex].totalInvested[_player],
        games[_gameIndex].totalValue[_player],
        games[_gameIndex].totalPaidOut[_player]
      );
  }
}