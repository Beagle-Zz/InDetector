contract c12863{
  /**
   * SafeMath sub function
   **/
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
}