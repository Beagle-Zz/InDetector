contract c14243{
  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}