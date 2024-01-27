contract c7060{
  /// @dev Set the new service account. Only owner.
  function changeServiceAccount(address _serviceAccount) public onlyOwner {
    serviceAccount = _serviceAccount;
  }
}