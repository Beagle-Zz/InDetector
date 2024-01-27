contract c16648{
  // Return current running game info
  function getCurrentGameInfo() public view returns (uint256, uint256, uint256, address[], uint256[]) {
    return getGameInfo(gameIndex);
  }
}