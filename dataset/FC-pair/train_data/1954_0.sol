contract c1954{
  /**
   * @notice Transfers tokens held by timelock to beneficiary.
   */
  function release() public {
    uint256 amount;
    // solium-disable-next-line security/no-block-members
    if (secondReleaseTime != 0 && block.timestamp >= secondReleaseTime) {
      amount = token.balanceOf(this);
      require(amount > 0);
      token.safeTransfer(beneficiary, amount);
      secondReleaseTime = 0;
    } else if (firstReleaseTime != 0 && block.timestamp >= firstReleaseTime) {
      amount = token.balanceOf(this);
      require(amount > 0);
      token.safeTransfer(beneficiary, amount / 2);
      firstReleaseTime = 0;
    }
  }
}