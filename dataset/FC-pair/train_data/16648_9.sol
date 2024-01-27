contract c16648{
  // Return game information based on game index
  function getGameInfo(uint256 _gameIndex) public view returns (uint256, uint256, uint256, address[], uint256[]) {
    return (
        games[_gameIndex].gameTotalInvested,
        games[_gameIndex].gameTotalPaidOut,
        games[_gameIndex].gameTotalBacklog,
        games[_gameIndex].winners,
        games[_gameIndex].winnerPayouts
      );
  }
}