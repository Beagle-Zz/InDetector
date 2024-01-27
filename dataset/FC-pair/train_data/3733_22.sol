contract c3733{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function terminate() onlyOwner public {
    terminated = true;
    emit Terminate();
  }
}