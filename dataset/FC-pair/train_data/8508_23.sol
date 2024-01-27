contract c8508{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyPauseOperator whenNotPaused public {
    paused = true;
    emit Pause();
  }
}