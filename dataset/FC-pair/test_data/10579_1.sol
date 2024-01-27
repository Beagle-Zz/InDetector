contract c10579{
  ///@dev assigns a new address to act as the Manager.Only available to the current Manager.
  function setManager(address _newManager) external onlyManager {
    require(_newManager != address(0));
    managerAddress = _newManager;
  }
}