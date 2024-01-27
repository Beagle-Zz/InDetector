contract c3512{
  /**
   * @dev Returns the lesser of two values.
   * @param a the first value
   * @param b the second value
   * @return result the lesser of the two values
   */
  function min(
    uint256 a,
    uint256 b
  ) public pure returns (uint256 result) {
    result = a <= b ? a : b;
    return result;
  }
}