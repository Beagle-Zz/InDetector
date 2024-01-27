contract c18661{
  // @dev Return a pseudo random number between lower and upper bounds
  function random(uint32 _upper, uint32 _lower)
    private
    returns (uint32)
  {
    require(_upper > _lower);
    seed = seed % uint32(1103515245) + 12345;
    return seed % (_upper - _lower) + _lower;
  }
}