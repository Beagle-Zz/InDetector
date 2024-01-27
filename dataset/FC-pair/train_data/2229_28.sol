contract c2229{
  /*
    @param _wallet - wallet address wanted to check
    @return amount of vested token
  */
  function vestedAmount(address _wallet) public view returns (uint256) {
    uint amonth = 30 days;
    Vesting memory vesting = vestingMap[_wallet];
    uint lockPeriod = vesting.lockMonths.mul(amonth);
    uint lockEndTime = vesting.startTime.add(lockPeriod);
    if (now >= lockEndTime) {
      return vesting.amount;
    } else if (now > vesting.startTime) {
      // vest a portion of token each month
      uint roundedPeriod = now
        .sub(vesting.startTime)
        .div(amonth)
        .mul(amonth);
      return vesting.amount
        .mul(roundedPeriod)
        .div(lockPeriod);
    } else {
      return 0;
    }
  }
}