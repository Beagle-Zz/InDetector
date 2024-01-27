contract c18305{
  /**
   * @dev Returnes holders address.
   */
  function returnHolder (uint _num) public constant returns (address){
      address _addr;
      _addr= payees[_num];
      return _addr;
  }
}