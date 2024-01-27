contract c2303{
  /// @notice Terminate token grant transferring all vested tokens to the `_recipient`
  /// and returning all non-vested tokens to the Colony MultiSig
  /// Secured to the Colony MultiSig only
  /// @param _recipient Address of the token grant recipient
  function removeTokenGrant(address _recipient) public 
  onlyColonyMultiSig
  {
    Grant storage tokenGrant = tokenGrants[_recipient];
    uint16 monthsVested;
    uint128 amountVested;
    (monthsVested, amountVested) = calculateGrantClaim(_recipient);
    uint128 amountNotVested = uint128(sub(sub(tokenGrant.amount, tokenGrant.totalClaimed), amountVested));
    require(token.transfer(_recipient, amountVested));
    require(token.transfer(colonyMultiSig, amountNotVested));
    tokenGrant.startTime = 0;
    tokenGrant.amount = 0;
    tokenGrant.vestingDuration = 0;
    tokenGrant.vestingCliff = 0;
    tokenGrant.monthsClaimed = 0;
    tokenGrant.totalClaimed = 0;
    emit GrantRemoved(_recipient, amountVested, amountNotVested);
  }
}