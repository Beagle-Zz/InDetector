contract c8101{
  /**
   * @dev Calculates the amount that has already vested but hasn't been released yet.
   * @param token ERC20MiniMe token which is being vested
   */
  function releasableAmount(ERC20MiniMe token) public constant returns (uint256) {
    return vestedAmount(token).sub(released[token]);
  }
}