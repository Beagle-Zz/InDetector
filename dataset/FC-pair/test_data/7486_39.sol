contract c7486{
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