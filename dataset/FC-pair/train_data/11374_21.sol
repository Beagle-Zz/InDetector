contract c11374{
  /**
   * @dev called by the owner to pause, triggers stopped state
   */
  function pause() onlyOwner whenNotPaused public {
    // Make sure pause cut off time isn't set or if it is, it's in the future
    // solium-disable-next-line security/no-block-members
    require(pauseCutoffTime == 0 || pauseCutoffTime >= block.timestamp);
    paused = true;
    emit Pause();
  }
}