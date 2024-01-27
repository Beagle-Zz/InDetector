contract c16648{
  // Return time when next game will start
  function getGameStartTime() public view returns (uint256) {
    return gameStartTime;
  }
}