contract c7489{
  /*
   *  Internal Functions
   */
  /// @dev Reviews and releases token for a given beneficiary
  /// @param _beneficiary address for which a token release should be attempted
  function _release(address _beneficiary)
    internal
    whenNotPaused
    returns (bool)
  {
    TokenLockVault memory lock = tokenLocks[_beneficiary];
    require(lock.beneficiary == _beneficiary);
    require(_beneficiary != 0x0);
    bool hasUnDueLocks = false;
    for (uint256 i = 0; i < lock.locks.length; i++) {
      Lock memory currentLock = lock.locks[i];
      // Skip any locks which are already released or revoked
      if (currentLock.released || currentLock.revoked) {
        continue;
      }
      // Skip any locks that are not due for release
      if (crowdsaleEndTime.add(currentLock.lockDuration) >= now) {
        hasUnDueLocks = true;
        continue;
      }
      // The amount of tokens to transfer must be less than the number of locked tokens
      require(currentLock.amount <= token.allowance(allowanceProvider, address(this)));
      // Release Tokens
      UnlockedTokens(_beneficiary, currentLock.amount);
      tokenLocks[_beneficiary].locks[i].released = true;
      tokenLocks[_beneficiary].tokenBalance = tokenLocks[_beneficiary].tokenBalance.sub(currentLock.amount);
      totalTokensLocked = totalTokensLocked.sub(currentLock.amount);
      assert(token.transferFrom(allowanceProvider, _beneficiary, currentLock.amount));
    }
    // If there are no future locks to be released, delete the lock vault
    if (!hasUnDueLocks) {
      delete tokenLocks[_beneficiary];
      lockIndexes[lock.lockIndex] = 0x0;
    }
    return true;
  }
}