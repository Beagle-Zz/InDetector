contract c1115{
  /**
   * @notice Transfers vested tokens to beneficiary.
   * @param _token ERC20 token which is being vested
   */
  function release(ERC20 _token) public {
    uint256 unreleased = releasableAmount(_token);
    require(unreleased > 0);
    released[_token] = released[_token].add(unreleased);
    _token.safeTransfer(beneficiary, unreleased);
    emit Released(unreleased);
  }
}