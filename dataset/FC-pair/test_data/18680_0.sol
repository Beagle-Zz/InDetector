contract c18680{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release() public {
    require(now >= releaseTime);
    uint256 amount = token.balanceOf(this);
    require(amount > 0);
    token.safeTransfer(beneficiary, amount);
  }
}