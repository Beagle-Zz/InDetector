contract c7922{
  /**
  * @dev Exponentiation two numbers, throws on overflow.
  */
  function pow(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(a ** b > 0);
    return a ** b;
  }
}