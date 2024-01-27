contract c3201{
  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint64 a, uint64 b) internal pure returns (uint64) {
    assert(b <= a);
    return a - b;
  }
}