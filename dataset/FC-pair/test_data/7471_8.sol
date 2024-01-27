contract c7471{
  /**
   * @dev Sets the claimer which will verify the ownership and call to set a tweedentity
   * @param _address Address of the claimer
   */
  function setClaimer(
    address _address
  )
  public
  onlyOwner
  {
    require(_address != address(0));
    claimer = _address;
    ClaimerSet(_address, false);
  }
}