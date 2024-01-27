contract c8318{
  /**
   * @dev Adds two numbers, throws on overflow.
   * @param a First number
   * @param b Second number
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}