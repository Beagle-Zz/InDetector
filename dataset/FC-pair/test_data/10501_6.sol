contract c10501{
  /**
   * @notice Owner can move tokens to any address
   */
  function transferTokens(address _to, uint256 _amount) external {
    require(_to != address(0x00));
    require(_amount > 0);
    uint256 balance = token.balanceOf(this);
    require(balance >= _amount);
    token.safeTransfer(_to, _amount);
  }
}