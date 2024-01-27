contract c7466{
  /**
   * @dev Creates locks for the provided _beneficiary with the provided amount
   * The creation can be peformed only if:
   * - the sender is the owner of the contract;
   * - the _beneficiary and _tokenHolder are valid addresses;
   * - the _amount is greater than 0 and was appoved by the _tokenHolder prior to the transaction.
   * The team members will have two locks with 1 and 2 years lock period, each having half of the amount.
   * @param _beneficiary Address that will own the lock.
   * @param _amount the amount of the locked tokens.
   * @param _start when the lock should start.
   * @param _tokenHolder the account that approved the amount for this contract.
   */
  function createTeamTokenTimeLock(
    address _beneficiary,
    uint256 _amount, 
    uint256 _start,
    address _tokenHolder
  ) external onlyOwner returns (bool)
    {
    require(_beneficiary != address(0) && _amount > 0);
    require(_tokenHolder != address(0));
    uint256 amount = _amount.div(2);
    TokenTimelock memory tokenLock1 = TokenTimelock(
      amount,
      _start.add(TEAM_LOCK_DURATION_PART1),
      false,
      true,
      false
    );
    tokenTimeLocks[_beneficiary].push(tokenLock1);
    TokenTimelock memory tokenLock2 = TokenTimelock(
      amount,
      _start.add(TEAM_LOCK_DURATION_PART2),
      false,
      true,
      false
    );
    tokenTimeLocks[_beneficiary].push(tokenLock2);
    require(token.transferFrom(_tokenHolder, this, _amount));
    emit TokenTimelockCreated(
      _beneficiary,
      tokenLock1.releaseTime,
      true,
      amount);
    emit TokenTimelockCreated(
      _beneficiary,
      tokenLock2.releaseTime,
      true,
      amount);
    return true;
  }
}