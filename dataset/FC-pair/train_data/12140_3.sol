contract c12140{
  /**
  * @dev called by the owner to pause, triggers stopped state
  */
  function pause() onlyOwner whenNotPaused returns (bool) {
    paused = true;
    Pause();
    return true;
  }
}