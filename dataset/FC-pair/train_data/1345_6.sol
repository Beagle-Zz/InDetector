contract c1345{
  // Requires game to be currently active
  modifier gameIsActive {
    require(gamePaused == false);
    _;
  }
}