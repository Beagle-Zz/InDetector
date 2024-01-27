contract c11789{
  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint a, uint b) internal pure returns (uint c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}