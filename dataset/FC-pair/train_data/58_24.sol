contract c58{
  // Checks modifier and allows transfer if tokens are not locked.
  function transfer(address _to, uint _value) canTransfer(msg.sender, _value) returns (bool) {
   return super.transfer(_to, _value);
  }
}