contract c7486{
  /// @dev Gets the lock at a given index for a given address
  /// @param _beneficiary The address used to look up the lock
  /// @param _lockIndex The index used to look up the lock
  function getLockByIndex(address _beneficiary, uint256 _lockIndex)
    public
    view
    returns (uint256 amount, uint256 lockDuration, bool released, bool revoked)
  {
    require(_lockIndex >= 0);
    require(_lockIndex <= tokenLocks[_beneficiary].locks.length.sub(1));
    return (
      tokenLocks[_beneficiary].locks[_lockIndex].amount,
      tokenLocks[_beneficiary].locks[_lockIndex].lockDuration,
      tokenLocks[_beneficiary].locks[_lockIndex].released,
      tokenLocks[_beneficiary].locks[_lockIndex].revoked
    );
  }
}