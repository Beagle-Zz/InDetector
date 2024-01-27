contract c12088{
  /// @notice Add a new token grant for user `_recipient`. Only one grant per user is allowed
  /// The amount of CLNY tokens here need to be preapproved for transfer by this `Vesting` contract before this call
  /// Secured to the Colony MultiSig only
  /// @param _recipient Address of the token grant recipient entitled to claim the grant funds
  /// @param _startTime Grant start time as seconds since unix epoch
  /// Allows backdating grants by passing time in the past. If `0` is passed here current blocktime is used. 
  /// @param _amount Total number of tokens in grant
  /// @param _vestingDuration Number of months of the grant's duration
  /// @param _vestingCliff Number of months of the grant's vesting cliff
  function addTokenGrant(address _recipient, uint256 _startTime, uint128 _amount, uint16 _vestingDuration, uint16 _vestingCliff) public 
  onlyColonyMultiSig
  noGrantExistsForUser(_recipient)
  {
    require(_vestingCliff > 0);
    require(_vestingDuration > _vestingCliff);
    uint amountVestedPerMonth = _amount / _vestingDuration;
    require(amountVestedPerMonth > 0);
    // Transfer the grant tokens under the control of the vesting contract
    token.transferFrom(colonyMultiSig, address(this), _amount);
    Grant memory grant = Grant({
      startTime: _startTime == 0 ? now : _startTime,
      amount: _amount,
      vestingDuration: _vestingDuration,
      vestingCliff: _vestingCliff,
      monthsClaimed: 0,
      totalClaimed: 0
    });
    tokenGrants[_recipient] = grant;
    emit GrantAdded(_recipient, grant.startTime, _amount, _vestingDuration, _vestingCliff);
  }
}