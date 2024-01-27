contract c13025{
  // return a pseudo random number between lower and upper bounds
  // given the number of previous blocks it should hash.
  function random(uint256 upper, uint256 sourceBlock) public returns (uint256 randomNumber) {
    return maxRandom(sourceBlock) % upper;
  }
}