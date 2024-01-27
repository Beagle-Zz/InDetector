contract c18339{
  /**
   * Developer status
   */
  function setDeveloperStatus (address _address, bool status) onlyOwner public {
    developers[_address] = status;
    emit DeveloperStatusChanged(_address, status);
  }
}