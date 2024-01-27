contract c16209{
  /**
   * @dev called by the owner to start, go to normal state
   */
  function start() onlyOwner public {
    started = true;
    Start();
  }
}