contract c7466{
  /**
   * @dev Returns the details of the lock referenced by the provided _beneficiary and _id.
   * @param _beneficiary Address owning the lock.
   * @param _id id of the lock.
   */
  function getTokenTimelockDetails(address _beneficiary, uint256 _id) view external returns (
    uint256 _amount,
    uint256 _releaseTime,
    bool _released,
    bool _revocable,
    bool _revoked) 
    {
    require(_id < tokenTimeLocks[_beneficiary].length);
    _amount = tokenTimeLocks[_beneficiary][_id].amount;
    _releaseTime = tokenTimeLocks[_beneficiary][_id].releaseTime;
    _released = tokenTimeLocks[_beneficiary][_id].released;
    _revocable = tokenTimeLocks[_beneficiary][_id].revocable;
    _revoked = tokenTimeLocks[_beneficiary][_id].revoked;
  }
}