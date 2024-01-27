contract c7383{
  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function divRemain(uint256 numerator, uint256 denominator) internal pure returns (uint256 quotient, uint256 remainder) {
    quotient  = div(numerator, denominator);
    remainder = sub(numerator, mul(denominator, quotient));
  }
}