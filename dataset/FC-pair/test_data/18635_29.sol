contract c18635{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release() public {
    require(block.timestamp >= releaseTime);
    uint256 amount = token.balanceOf(this);
    require(amount > 0);
    token.safeTransfer(beneficiary, amount);
  }
}