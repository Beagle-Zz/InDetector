contract c40101{
   
  modifier when_non_zero(uint _value) {
    if (_value == 0) throw;
    _;
  }
}