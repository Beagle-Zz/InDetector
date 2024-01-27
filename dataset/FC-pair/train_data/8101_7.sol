contract c8101{
  /**
   * @dev Calculates the amount that has already vested.
   * @param token ERC20MiniMe token which is being vested
   */
  function vestedAmount(ERC20MiniMe token) public constant returns (uint256) {
    uint256 currentBalance = token.balanceOf(this);
    uint256 totalBalance = currentBalance.add(released[token]);
    if (now < cliff) {
      return 0;
    } else if (now >= start.add(duration) || revoked[token]) {
      return totalBalance;
    } else {
      return totalBalance.mul(now.sub(start)).div(duration);
    }
  }
}