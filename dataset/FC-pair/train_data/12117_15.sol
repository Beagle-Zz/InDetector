contract c12117{
  /**
   * @dev mint timelocked tokens
   */
  function mintTimelocked(address _to, uint256 _amount, uint256 _releaseTime) public
    onlyOwner canMint returns (TokenTimelock) {
    TokenTimelock timelock = new TokenTimelock(this, _to, _releaseTime);
    mint(timelock, _amount);
    return timelock;
  }
}