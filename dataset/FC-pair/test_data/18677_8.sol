contract c18677{
  /**
   * Management list manegement
   */
  function setManagement(address _address, bool _state) public onlyOwner {
    isManagement[_address] = _state;
    ManagementWhitelisted(_address, _state);
  }
}