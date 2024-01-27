contract c7489{
  /// @dev Allows the owner to update the total amount of USD raised. T
  function setUSDRaised(uint256 _total)
    public
    onlyOwner
    whenNotFinalized
  {
    require(_total > 0);
    totalUSDRaised = _total;
    USDRaisedUpdated(_total);
  }
}