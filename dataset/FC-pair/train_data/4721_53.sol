contract c4721{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release() public {
    // solium-disable-next-line security/no-block-members
    require(block.timestamp >= releaseTime);
    uint256 amount = token.balanceOf(this);
    require(amount > 0);
    token.safeTransfer(beneficiary, amount);
  }
}