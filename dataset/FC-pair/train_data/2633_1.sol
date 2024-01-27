contract c2633{
  // Requires game to be currently active
  modifier gameIsActive {
    require(gamePaused == false);
    _;
  }
}