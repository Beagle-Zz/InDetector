contract c8667{
  /* Initial supply is  224,115,116 OGX */
  /**
   * @dev mint timelocked tokens
   */
  function mintTimelocked(address _to, uint256 _amount, uint256 _releaseTime)
    onlyOwner canMint returns (TokenTimelock) {
    TokenTimelock timelock = new TokenTimelock(this, _to, _releaseTime);
    mint(timelock, _amount);
    return timelock;
  }
}