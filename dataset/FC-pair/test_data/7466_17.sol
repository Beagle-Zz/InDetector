contract c7466{
   /**
   * @dev Releases the tokens for the provided _beneficiary and _id.
   * The release can be peformed only if:
   * - the controller was activated by the crowdsale contract;
   * - the _beneficiary and _id reference a valid lock;
   * - the lock was not revoked;
   * - the lock was not released before;
   * - the lock period has passed.
   * @param _beneficiary Address owning the lock.
   * @param _id id of the lock.
   */
  function releaseFor(address _beneficiary, uint256 _id) public onlyWhenActivated onlyValidTokenTimelock(_beneficiary, _id) {
    TokenTimelock storage tokenLock = tokenTimeLocks[_beneficiary][_id];
    require(!tokenLock.released);
    // solium-disable-next-line security/no-block-members
    require(block.timestamp >= tokenLock.releaseTime);
    tokenLock.released = true;
    require(token.transfer(_beneficiary, tokenLock.amount));
    emit TokenTimelockReleased(_beneficiary, tokenLock.amount);
  }
}