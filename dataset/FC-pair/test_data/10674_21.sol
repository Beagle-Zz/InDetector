contract c10674{
  /**
  * @dev Calculate the average of two signed integers numbers 
  * @notice 1.5 will be toward zero
  * @return An int256 representing integer average
  */
  function signedAverage(int256 a, int256 b) public pure returns (int256) {
    int256 ans = a + b;
    if (a > 0 && b > 0 && ans <= 0) {
      require(false);
    }
    if (a < 0 && b < 0 && ans >= 0) {
      require(false);
    }
    return ans / 2;
  }
}