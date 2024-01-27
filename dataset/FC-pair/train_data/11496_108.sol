contract c11496{
  // @return Square root of the given value.
  function sqrt(uint32 _value) 
    private pure
    returns (uint32) 
  {
    uint32 z = (_value + 1) / 2;
    uint32 y = _value;
    while (z < y) {
      y = z;
      z = (_value / z + z) / 2;
    }
    return y;
  }
}