contract c12382{
  /*
  withdraw all released vesting coin to balance
  */
  function withdrawVestings(address _to) internal {
    uint256 sum = 0;
    for (uint i=0; i<vestings[_to].length; i++) {
      if (vestings[_to][i].amount == vestings[_to][i].withdrawed) {
        continue;
      }
      uint256 released = vestingReleased(
        vestings[_to][i].startTime, vestings[_to][i].initReleaseAmount, vestings[_to][i].amount,
        vestings[_to][i].interval, vestings[_to][i].periods
      );
      uint256 remain = released.sub(vestings[_to][i].withdrawed);
      if (remain >= 0) {
        vestings[_to][i].withdrawed = released;
        sum = sum.add(remain);
      }
    }
    balances[_to] = balances[_to].add(sum);
  }
}