contract c58{
  // Checks modifier and allows transfer if tokens are not locked.
  function transferFrom(address _from, address _to, uint _value) canTransfer(_from, _value) returns (bool) {
   return super.transferFrom(_from, _to, _value);
  }
}