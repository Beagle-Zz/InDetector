contract c16793{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused  public returns (bool) {
    paused = true;
    Pause();
    return true;
  }
}