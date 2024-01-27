contract c8540{
  /**
  * @dev transfer and lock token for a specified address
  * @param _to The address to transfer to.
  * @param _value The amount to be transferred.
  * @param _releaseTime The time to be locked.
  */
  function transferLockedToken(address _to, uint256 _value, uint256 _releaseTime) public whenNotPaused nonReentrant returns (bool) {
    require(_releaseTime > now);
    //require(_releaseTime.sub(1 years) < now);
    balances[msg.sender] = balances[msg.sender].sub(_value);
    lockedBalances[lockedBalanceCount] = LockedBalance({owner: _to, value: _value, releaseTime: _releaseTime});
    lockedBalanceCount++;
    emit TransferLockedToken(msg.sender, _to, _value, _releaseTime);
    return true;
  }
}