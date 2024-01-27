contract c3516{
  /**
   * @dev Subtracts the minuend from the subtrahend, returns the difference
   * @param minuend the minuend
   * @param subtrahend the subtrahend
   * @return difference the difference (e.g. minuend - subtrahend)
   */
  function minus(
    uint256 minuend,
    uint256 subtrahend
  ) public pure returns (uint256 difference) {
    assert(minuend >= subtrahend);
    difference = minuend - subtrahend;
    return difference;
  }
}