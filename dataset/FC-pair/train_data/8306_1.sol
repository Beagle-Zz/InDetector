contract c8306{
  /**
   * @dev Integer division of two numbers, truncating the quotient.
   * @param a First number
   * @param b Second number
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }
}