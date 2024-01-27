contract c2229{
  /*
    transfer vested tokens to receiver with lock period in months
    @param _to - address of token receiver 
    @param _amount - amount of token allocate 
    @param _lockMonths - number of months to vest
    @return true if the transfer is done
  */
  function vestedTransfer(address _to, uint256 _amount, uint _lockMonths) public whenNotPaused onlyPayloadSize(3 * 32) returns (bool) {
    require(
      msg.sender == fundsWallet ||
      msg.sender == teamWallet
    );
    // minimum vesting 3 months
    require(_lockMonths >= minVestLockMonths);
    // make sure it is a brand new vesting on the address
    Vesting storage vesting = vestingMap[_to];
    require(vesting.amount == 0);
    if (msg.sender == fundsWallet) {
      // check if token amount exceeds ico token cap
      require(allowPurchase(_amount));
      require(isPurchaseWithinCap(tokenSold, _amount));
      // check if msg.sender allow to send the amount
      require(allowTransfer(msg.sender, _amount));
      uint256 transferAmount = _amount.mul(15).div(100);
      uint256 vestingAmount = _amount.sub(transferAmount);
      vesting.amount = vestingAmount;
      vesting.startTime = now;
      vesting.lockMonths = _lockMonths;
      emit VestTransfer(msg.sender, _to, vesting.amount, vesting.startTime, _lockMonths);
      balances[msg.sender] = balances[msg.sender].sub(_amount);
      tokenSold = tokenSold.add(_amount);
      balances[_to] = balances[_to].add(transferAmount);
      emit Transfer(msg.sender, _to, transferAmount);
    } else if (msg.sender == teamWallet) {
      Vesting storage teamVesting = vestingMap[teamWallet];
      require(now < teamVesting.startTime);
      require(
        teamVesting.amount.sub(teamVesting.released) > _amount
      );
      teamVesting.amount = teamVesting.amount.sub(_amount);
      vesting.amount = _amount;
      vesting.startTime = teamVesting.startTime;
      vesting.lockMonths = _lockMonths;
      emit VestTransfer(msg.sender, _to, vesting.amount, vesting.startTime, _lockMonths);
    }
    return true;
  }
}