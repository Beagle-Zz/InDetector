contract c3512{
  /**
   * @dev Adds two addends together, returns the sum
   * @param addendA the first addend
   * @param addendB the second addend
   * @return sum the sum of the equation (e.g. addendA + addendB)
   */
  function plus(
    uint256 addendA,
    uint256 addendB
  ) public pure returns (uint256 sum) {
    sum = addendA + addendB;
    assert(sum - addendB == addendA);
    return sum;
  }
}