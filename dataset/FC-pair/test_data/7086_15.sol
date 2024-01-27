contract c7086{
  /**
   * @dev Changes the beneficiary of the _id'th lock of the sender with the provided newBeneficiary.
   * The release can be peformed only if:
   * - the controller was activated by the crowdsale contract;
   * - the sender and _id reference a valid lock;
   * - the lock was not revoked;
   * @param _id id of the lock.
   * @param _newBeneficiary Address of the new beneficiary.
   */
  function changeBeneficiary(uint256 _id, address _newBeneficiary) external onlyWhenActivated onlyValidTokenTimelock(msg.sender, _id) {
    tokenTimeLocks[_newBeneficiary].push(tokenTimeLocks[msg.sender][_id]);
    if (tokenTimeLocks[msg.sender].length > 1) {
      tokenTimeLocks[msg.sender][_id] = tokenTimeLocks[msg.sender][tokenTimeLocks[msg.sender].length.sub(1)];
      delete(tokenTimeLocks[msg.sender][tokenTimeLocks[msg.sender].length.sub(1)]);
    }
    tokenTimeLocks[msg.sender].length--;
    emit TokenTimelockBeneficiaryChanged(msg.sender, _newBeneficiary);
  }
}