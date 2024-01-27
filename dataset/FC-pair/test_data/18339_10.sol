contract c18339{
  /**
   * developer modifier
   */
  modifier onlyActiveDeveloper() {
    require(developers[msg.sender] == true);
    _;
  }
}