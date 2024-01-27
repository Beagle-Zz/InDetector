contract c10506{
  /**
   * @notice release tokens held by the contract to advisor.
   */
  function release(uint256 _amount) public {
    require(_amount > 0);
    require(releasedTokens >= _amount);
    releasedTokens = releasedTokens.sub(_amount);
    uint256 balance = token.balanceOf(this);
    require(balance >= _amount);
    token.safeTransfer(advisor, _amount);
  }
}