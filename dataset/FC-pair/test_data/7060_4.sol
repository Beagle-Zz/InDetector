contract c7060{
  /// @dev Set the service percentage. Only owner.
  function changeServicePercentage(uint _servicePercentage) public onlyOwner {
    servicePercentage = _servicePercentage;
  }
}