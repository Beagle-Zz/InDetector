contract c18305{
  /**
   * @dev Returnes number of holders in array.
   */
  function returnPayees () public constant returns (uint){
      uint _ammount;
      _ammount= payees.length;
      return _ammount;
  }
}