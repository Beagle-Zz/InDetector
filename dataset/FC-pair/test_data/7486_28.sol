contract c7486{
  /// @dev Function to check if crowdsale is open
  function isOpen()
    public
    view
    whenNotPaused
    whenNotFinalized
    returns(bool)
  {
    return now >= crowdsaleStartTime;
  }
}