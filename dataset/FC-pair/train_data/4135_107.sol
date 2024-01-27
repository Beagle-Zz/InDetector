contract c4135{
  // @return Bigger value of two uint32s.
  function max(uint32 _value1, uint32 _value2)
    private pure
    returns (uint32)
  {
    if(_value1 >= _value2)
      return _value1;
    else
      return _value2;
  }
}