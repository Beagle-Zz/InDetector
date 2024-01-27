contract c3386{
  /**
  * @dev Integer division of two signed integers, truncating the quotient.
  */
  function div(int256 a, int256 b) internal pure returns (int256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // Overflow only happens when the smallest negative int is multiplied by -1.
    int256 INT256_MIN = int256((uint256(1) << 255));
    assert(a != INT256_MIN || b != -1);
    return a / b;
  }
}