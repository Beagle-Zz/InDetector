contract c8716{
  /**
   * @dev Sets if NFTs are paused or not.
   * @param _isPaused Pause status.
   */
  function setPause(
    bool _isPaused
  )
    external
    onlyOwner
  {
    require(isPaused != _isPaused);
    isPaused = _isPaused;
    emit IsPaused(_isPaused);
  }
}