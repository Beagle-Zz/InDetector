contract c10033{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function stop() public onlyOwner whenNotStopped {
    stopped = true;
    emit Stop();
  }
}