contract c3213{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public 
  {
    paused = true;
    emit Pause();
  }
}