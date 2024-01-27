contract c7486{
  /// @dev Locks tokens for a given beneficiary
  /// @param _beneficiary The address to which the tokens will be released
  /// @param _lockDuration The duration of time that must elapse after the crowdsale end date
  /// @param _tokens The amount of tokens to be locked
  function lockTokens(address _beneficiary, uint256 _lockDuration, uint256 _tokens)
    external
    ownerOrCrowdsale
    whenNotPaused
  {
    // Lock duration must be greater than zero seconds
    require(_lockDuration >= 0);
    // Token amount must be greater than zero
    require(_tokens > 0);
    // Token Lock must have a sufficient allowance prior to creating locks
    require(_tokens.add(totalTokensLocked) <= token.allowance(allowanceProvider, address(this)));
    TokenLockVault storage lock = tokenLocks[_beneficiary];
    // If this is the first lock for this beneficiary, add their address to the lock indexes
    if (lock.beneficiary == 0) {
      lock.beneficiary = _beneficiary;
      lock.lockIndex = lockIndexes.length;
      lockIndexes.push(_beneficiary);
    }
    // Add the lock
    lock.locks.push(Lock(_tokens, _lockDuration, false, false));
    // Update the total tokens for this beneficiary
    lock.tokenBalance = lock.tokenBalance.add(_tokens);
    // Update the number of locked tokens
    totalTokensLocked = _tokens.add(totalTokensLocked);
    LockedTokens(_beneficiary, _tokens, _lockDuration);
  }
}