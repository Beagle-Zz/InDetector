contract c18661{
  // @return Bigger value of two uint32s.
  function min(uint32 _value1, uint32 _value2)
    private pure
    returns (uint32)
  {
    if(_value2 >= _value1)
      return _value1;
    else
      return _value2;
  }
}