contract c7486{
  /// @dev Allows the owner to set the current rate for calculating the number of tokens for a purchase.
  /// @dev An external cron job will fetch the ETH/USD daily average from the cryptocompare API and call this function.
  function setRate(uint256 _newRate)
    public
    onlyOwner
    whenNotFinalized
    returns(bool)
  {
    require(_newRate > 0);
    rate = _newRate;
    RateChanged(rate);
    return true;
  }
}