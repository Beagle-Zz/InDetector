contract c12561{
  /*
  sum of all vestings balance (regardless of released or not)
  each vesting is amount - withdrawed
  */
  function vestingsBalance(address _to) public view returns (uint256) {
    uint256 sum = 0;
    for (uint i=0; i<vestings[_to].length; i++) {
      sum = sum.add(vestings[_to][i].amount.sub(vestings[_to][i].withdrawed));
    }
    return sum;
  }
}