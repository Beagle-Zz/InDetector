contract c3321{
  /**
   * @dev Determines whether a value is less than another.
   * @param a the first value
   * @param b the second value
   * @return isTrue whether a is less than b
   */
  function isLessThan(uint256 a, uint256 b) public pure returns (bool isTrue) {
    isTrue = a < b;
    return isTrue;
  }
}