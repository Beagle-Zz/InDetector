contract c4567{
// Saftey Checks for Subtraction Tasks
  function sub(uint256 a, uint256 b) internal constant returns (uint256) {
    assert(b <= a);
    return a - b;
  }
}