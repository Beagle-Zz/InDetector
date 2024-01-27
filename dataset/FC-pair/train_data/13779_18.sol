contract c13779{
  ///////////////////////////////////////////////////////////
  /// Transfer Updates
  ///////////////////////////////////////////////////////////
  function transfer(address _to, uint256 _value) validDestination(_to) public returns (bool) {
    return super.transfer(_to, _value);
  }
}