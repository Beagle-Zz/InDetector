contract c3321{
  /**
   * @dev Divides the dividend by divisor, returns the truncated quotient
   * @param dividend the dividend
   * @param divisor the divisor
   * @return quotient the quotient of the equation (e.g. dividend / divisor)
   */
  function dividedBy(
    uint256 dividend,
    uint256 divisor
  ) public pure returns (uint256 quotient) {
    return div(dividend, divisor);
  }
}