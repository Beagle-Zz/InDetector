contract c12323{
  /**
   * @notice Transfers vested tokens to beneficiary.
   * @dev Removed original require that amount released was > 0 ; releasing 0 is fine
   * @param token ERC20 token which is being vested
   */
  function release(ERC20Basic token) public {
    uint256 unreleased = releasableAmount(token);
    released[token] = released[token].add(unreleased);
    token.safeTransfer(beneficiary, unreleased);
    Released(unreleased);
  }
}