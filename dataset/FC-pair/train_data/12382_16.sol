contract c12382{
  /*
  sum of vestings balance and unlocking coin balance
  */
  function vestingsRemainBalance(address _to) internal view returns (uint256) {
    return vestingsReleasedRemain(_to).add(super.balanceOf(_to));
  }
}