contract c3512{
  /**
   * @dev Returns the greater of two values.
   * @param a the first value
   * @param b the second value
   * @return result the greater of the two values
   */
  function max(
    uint256 a,
    uint256 b
  ) public pure returns (uint256 result) {
    result = a >= b ? a : b;
    return result;
  }
}