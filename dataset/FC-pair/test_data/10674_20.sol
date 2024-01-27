contract c10674{
  /**
  * @dev Calculate the average of two integer numbers 
  * @notice 1.5 will be rounded toward zero
  * @return An uint256 representing integer average
  */
  function average(uint256 a, uint256 b) public pure returns (uint256) {
    return a.add(b).div(2);
  }
}