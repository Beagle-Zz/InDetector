contract c12382{
  /*
  total balance
  sum of vestings balance (includes not released part) and unlocking coin balance
  */
  function balanceOf(address _to) public view returns (uint256) {
    uint256 vbalance = vestingsBalance(_to);
    return vbalance.add(super.balanceOf(_to));
  }
}