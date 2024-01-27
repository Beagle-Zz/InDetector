contract c13005{
  /* Getters getSpaceship* */
  function getSpaceshipTotalSold() public view returns (uint256) {
    return super.totalSupply();
  }
}