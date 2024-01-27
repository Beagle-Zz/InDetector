contract c7489{
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