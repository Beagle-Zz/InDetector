contract c18307{
  /**
   * @dev Returnes registration date of holder.
   */
  function returnRegDate (address _who) public constant returns (uint){
      uint _redData;
      _redData= holders[_who].regTime;
      return _redData;
  }
}