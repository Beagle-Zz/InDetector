contract c18305{
  /**
   * @dev Returnes holders balance.
   */
  function returnBalance (address _who) public constant returns (uint){
      uint _balance;
      _balance= holders[_who].balance;
      return _balance;
  }
}