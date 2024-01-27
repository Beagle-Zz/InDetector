contract c18888{
  /**
   * @dev Calculates the amount that has already vested.
   */
  function vestedAmount() public constant returns (uint256) {
    uint256 currentBalance = token.balanceOf(this);
    uint256 totalBalance = currentBalance.add(released);
    if (now < cliff) {
      return 0;
    } else if (now >= start.add(duration) || revoked) {
      return totalBalance;
    } else {
      return totalBalance.mul(now.sub(start)).div(duration);
    }
  }
}