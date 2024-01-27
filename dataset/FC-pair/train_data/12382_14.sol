contract c12382{
  /*
  sum of all remaining vestings balance (only the released part)
  released - withdrawed
  */
  function vestingsReleasedRemain(address _to) internal view returns (uint256) {
    uint256 sum = 0;
    for (uint i=0; i<vestings[_to].length; i++) {
      uint256 released = vestingReleased(
        vestings[_to][i].startTime, vestings[_to][i].initReleaseAmount, vestings[_to][i].amount,
        vestings[_to][i].interval, vestings[_to][i].periods
      );
      sum = sum.add(released.sub(vestings[_to][i].withdrawed));
    }
    return sum;
  }
}