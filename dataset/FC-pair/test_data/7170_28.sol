contract c7170{
  ///// 827 section
  /////////////////
  function approveAndCall(address _spender, uint256 _value, bytes _data) public payable whenNotPaused returns (bool) {
    return super.approveAndCall(_spender, _value, _data);
  }
}