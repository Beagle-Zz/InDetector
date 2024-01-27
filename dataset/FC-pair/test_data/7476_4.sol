contract c7476{
  // config
  /**
  * @dev Updates the checker for the store
  * @param _address Checker's address
  */
  function setNewChecker(
    address _address
  )
  external
  onlyOwner
  {
    require(_address != address(0));
    checker = UidCheckerInterface(_address);
  }
}