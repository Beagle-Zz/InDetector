contract c7476{
  /**
  * @dev Sets the manager
  * @param _address Manager's address
  */
  function setManager(
    address _address
  )
  external
  onlyOwner
  {
    require(_address != address(0));
    manager = _address;
    ManagerSet(_address, false);
  }
}