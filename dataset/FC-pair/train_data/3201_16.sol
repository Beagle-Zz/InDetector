contract c3201{
  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint64 a, uint64 b) internal pure returns (uint64) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint64 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }
}