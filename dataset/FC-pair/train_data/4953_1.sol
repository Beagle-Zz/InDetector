contract c4953{
// Saftey Checks for Divison Tasks
  function div(uint256 a, uint256 b) internal constant returns (uint256) {
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }
}