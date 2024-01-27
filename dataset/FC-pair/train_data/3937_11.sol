contract c3937{
  /**
   * @dev Determines whether a value is greater than another.
   * @param a the first value
   * @param b the second value
   * @return isTrue whether a is greater than b
   */
  function isGreaterThan(uint256 a, uint256 b) public pure returns (bool isTrue) {
    isTrue = a > b;
  }
}