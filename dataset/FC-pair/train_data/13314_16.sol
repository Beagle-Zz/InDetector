contract c13314{
  /**
   * @dev Distribute tokens from presale address to an address.
   * @param _to address  The address which you want to distribute to
   * @param _amount uint256  The amount of tokens to be distributed
   * @param _lockCycle uint256  Token locking cycle.
   * @param _duration uint256  The lock time for each cycle.
   */
  function _distribute(address _to, uint256 _amount, uint256 _lockCycle, uint256 _duration) internal returns(bool)  {
    ////Do not allow multiple distributions of the same address. Avoid locking time reset.
    require(_lockInfo[_to].amount == 0 );
    require(_lockupBalances[_to] == 0);
    _lockInfo[_to].amount = _amount;
    _lockInfo[_to].releaseCount = _lockCycle;
    _lockInfo[_to].start = now;
    _lockInfo[_to].transfered = 0;
    _lockInfo[_to].duration = _duration;
    //Easy to query locked balance
    _lockupBalances[_to] = _amount;
    return true;
  }
}