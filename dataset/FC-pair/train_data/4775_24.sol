contract c4775{
  /**
   * @dev called by the owner to lock, triggers stopped state
   */
  function lock
  (
    address _granted, 
    uint256 _amount, 
    uint256 _expiresAt
  ) 
    onlyOwnerOrAdmin(ROLE_LOCKUP) 
    public 
  {
    require(_amount > 0);
    require(_expiresAt > now);
    grantedLocks[_granted].push(Lock(_amount, _expiresAt));
    emit Locked(_granted, _amount, _expiresAt);
  }
}