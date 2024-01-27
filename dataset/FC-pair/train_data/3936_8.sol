contract c3936{
  /**
   * @dev Switches the contract from paused to non-paused or vice-versa
   */
  function togglePause() public ownerOnly {
    paused = !paused;
    emit PauseToggled(paused);
  }
}