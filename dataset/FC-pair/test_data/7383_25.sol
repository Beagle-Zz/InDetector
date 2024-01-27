contract c7383{
  /**
   * @dev called by the owner to unlock, returns to normal state
   */
  function unlock
  (
    address _granted
  ) 
    onlyOwnerOrAdmin(ROLE_LOCKUP) 
    public 
  {
    require(grantedLocks[_granted].length > 0);
    delete grantedLocks[_granted];
    emit UnlockedAll(_granted);
  }
}