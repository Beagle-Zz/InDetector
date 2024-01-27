contract c7476{
  /**
  * @dev Sets new manager
  */
  function switchManagerAndRemoveOldOne()
  external
  onlyOwner
  {
    require(newManager != address(0));
    ManagerSwitch(manager, newManager);
    manager = newManager;
    newManager = address(0);
  }
}