contract c7475{
  /**
  * @dev Sets new manager
  * @param _address New manager's address
  */
  function setNewManager(
    address _address
  )
  external
  onlyOwner
  {
    require(_address != address(0) && manager != address(0));
    newManager = _address;
    ManagerSet(_address, true);
  }
}