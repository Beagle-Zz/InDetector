contract c7245{
/**
* Issue: Change to internal pure
**/
  function minus(uint a, uint b) internal pure returns (uint) {
    assert(b <= a);
    return a - b;
  }
}