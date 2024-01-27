contract c11245{
  /**
   * @notice claim ERC20Basic compatible tokens
   */
  function claimTokens(ERC20Basic _token) external onlyOwner {
    require(isFinalized);
    uint256 balance = _token.balanceOf(this);
    _token.transfer(owner, balance);
    emit ClaimTokens(_token, balance);
  }
}