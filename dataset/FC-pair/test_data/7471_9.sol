contract c7471{
  /**
   * @dev Sets a new claimer during updates
   * @param _address Address of the new claimer
   */
  function setNewClaimer(
    address _address
  )
  public
  onlyOwner
  {
    require(_address != address(0) && claimer != address(0));
    newClaimer = _address;
    ClaimerSet(_address, true);
  }
}