contract c10165{
  /**
   * @notice save the block number
   */
  function buyTokensPreHook(address _beneficiary, uint256 _toFund) internal {
    recentBlock[msg.sender] = block.number;
    super.buyTokensPreHook(_beneficiary, _toFund);
  }
}