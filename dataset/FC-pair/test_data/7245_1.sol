contract c7245{
/**
* Issue: Change to internal pure
**/
  function plus(uint a, uint b) internal pure returns (uint) {
    uint c = a + b;
    assert(c>=a && c>=b);
    return c;
  }
}