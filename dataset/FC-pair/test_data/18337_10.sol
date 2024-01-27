contract c18337{
  /**
   * developer modifier
   */
  modifier onlyActiveDeveloper() {
    require(developers[msg.sender] == true);
    _;
  }
}