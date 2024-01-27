contract c2005{
  /**
    @dev Contructor to the vending Machine
    @param status The new open status for the vending Machine
  **/
  function modifyOpenStatus(bool status) public isOwner {
    open = status;
    emit StatusChanged(status);
  }
}