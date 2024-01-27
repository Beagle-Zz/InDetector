contract c2593{
  // Only owner address can set emergency pause #1
  function ownerPauseGame(bool newStatus) public
  onlyOwner
  {
    gamePaused = newStatus;
  }
}