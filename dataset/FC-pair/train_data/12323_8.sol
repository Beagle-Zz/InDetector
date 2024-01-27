contract c12323{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   * @dev Removed original require that amount released was > 0 ; releasing 0 is fine
   */
  function release() public {
    require(now >= releaseTime);
    uint256 amount = token.balanceOf(this);
    token.safeTransfer(beneficiary, amount);
  }
}