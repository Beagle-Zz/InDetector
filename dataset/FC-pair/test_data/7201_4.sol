contract c7201{
  /// @dev Set the new service account. Only owner.
  function changeServiceAccount(address _serviceAccount) public onlyOwner {
    serviceAccount = _serviceAccount;
  }
}