contract c10674{
  /**
  * @dev get the upgrade manager address
  * @return the upgrade manager address
  */
  function upgradeManager() public view returns (address) {
    return upgradeManager_;
  }
}