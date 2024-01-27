contract c7466{
  /**
   * @dev Creates a lock for the provided _beneficiary with the provided amount
   * The creation can be peformed only if:
   * - the sender is the address of the crowdsale;
   * - the _beneficiary and _tokenHolder are valid addresses;
   * - the _amount is greater than 0 and was appoved by the _tokenHolder prior to the transaction.
   * The investors will have a lock with a lock period of 6 months.
   * @param _beneficiary Address that will own the lock.
   * @param _amount the amount of the locked tokens.
   * @param _start when the lock should start.
   * @param _tokenHolder the account that approved the amount for this contract.
   */
  function createInvestorTokenTimeLock(
    address _beneficiary,
    uint256 _amount, 
    uint256 _start,
    address _tokenHolder
  ) external onlyCrowdsale returns (bool)
    {
    require(_beneficiary != address(0) && _amount > 0);
    require(_tokenHolder != address(0));
    TokenTimelock memory tokenLock = TokenTimelock(
      _amount,
      _start.add(INVESTOR_LOCK_DURATION),
      false,
      false,
      false
    );
    tokenTimeLocks[_beneficiary].push(tokenLock);
    require(token.transferFrom(_tokenHolder, this, _amount));
    emit TokenTimelockCreated(
      _beneficiary,
      tokenLock.releaseTime,
      false,
      _amount);
    return true;
  }
}