contract c7466{
  /**
   * @dev Revokes the lock for the provided _beneficiary and _id.
   * The revoke can be peformed only if:
   * - the sender is the owner of the contract;
   * - the controller was activated by the crowdsale contract;
   * - the _beneficiary and _id reference a valid lock;
   * - the lock was not revoked;
   * - the lock is revokable;
   * - the lock was not released.
   * @param _beneficiary Address owning the lock.
   * @param _id id of the lock.
   */
  function revokeTokenTimelock(
    address _beneficiary,
    uint256 _id) 
    external onlyWhenActivated onlyOwner onlyValidTokenTimelock(_beneficiary, _id)
  {
    require(tokenTimeLocks[_beneficiary][_id].revocable);
    require(!tokenTimeLocks[_beneficiary][_id].released);
    TokenTimelock storage tokenLock = tokenTimeLocks[_beneficiary][_id];
    tokenLock.revoked = true;
    require(token.transfer(owner, tokenLock.amount));
    emit TokenTimelockRevoked(_beneficiary);
  }
}