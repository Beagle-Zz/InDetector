contract c16089{
  /**
   * @dev Allows the owner or manager to replace the current manager
   * @param newManager The address to give contract management rights.
   */
  function replaceManager(address newManager) public onlyManagement {
    require(newManager != address(0));
    emit ManagementChanged(manager, newManager);
    manager = newManager;
  }
}