contract c7486{
  /// @dev Revokes the lock at a given index for a given address
  /// @param _beneficiary The address used to look up the lock
  /// @param _lockIndex The lock index to be revoked
  function revokeLockByIndex(address _beneficiary, uint256 _lockIndex)
    public
    onlyOwner
    returns (bool)
  {
    require(_lockIndex >= 0);
    require(_lockIndex <= tokenLocks[_beneficiary].locks.length.sub(1));
    require(!tokenLocks[_beneficiary].locks[_lockIndex].revoked);
    tokenLocks[_beneficiary].locks[_lockIndex].revoked = true;
    return true;
  }
}