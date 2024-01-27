contract c7489{
  /// @dev Finalizes crowdsale
  function _finalization()
    internal
    whenNotFinalized
  {
    isFinalized = true;
    tokenLock.finishCrowdsale();
    CrowdsaleFinished();
  }
}