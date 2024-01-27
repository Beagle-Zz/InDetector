contract c7489{
  /// @dev Transfers any tokens held in a timelock vault to beneficiary if they are due for release.
  function releaseTokens()
    public
    whenNotPaused
    returns(bool)
  {
    require(crowdsaleFinished);
    require(_release(msg.sender));
    return true;
  }
}