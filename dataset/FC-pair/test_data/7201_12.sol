contract c7201{
  /// @dev Setter for traders smart contract (Only owner)
  function changeTraders(ITraders _traders) public onlyOwner {
    traders = _traders;
  }
}