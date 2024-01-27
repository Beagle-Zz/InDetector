contract c7489{
  /// @dev Marks the crowdsale as being finished and sets the crowdsale finish date
  function finishCrowdsale()
    public
    ownerOrCrowdsale
    whenNotPaused
  {
    require(!crowdsaleFinished);
    crowdsaleFinished = true;
    crowdsaleEndTime = now;
    FinishedCrowdsale();
  }
}