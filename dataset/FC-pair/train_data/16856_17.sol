contract c16856{
  /**
   * @dev transfer timelocked tokens
   */
  function transferTimelocked(address _to, uint256 _amount, uint256 _releaseTime)
    onlyOwner whenNotPaused returns (TokenTimelock) {
    require(_to != 0x0);
    balances[msg.sender] = balances[msg.sender].sub(_amount);
    TokenTimelock timelock = new TokenTimelock(this, _to, _releaseTime);
    emit TimeLock(_to, _amount,_releaseTime);
    return timelock;
  }
}