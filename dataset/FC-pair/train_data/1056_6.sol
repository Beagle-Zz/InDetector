contract c1056{
    // Requires the game to be currently active
    modifier gameIsActive {
      require(gamePaused == false);
      _;
    }
}