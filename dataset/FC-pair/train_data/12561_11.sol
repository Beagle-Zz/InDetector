contract c12561{
  /*
  calculate the released amount of vesting coin
  it cannot be view, because this function relays on 'now'
  */
  function vestingReleased(uint256 _startTime, uint256 _initReleaseAmount, uint256 _amount, uint256 _interval, uint256 _periods) internal view returns (uint256) {
    return vestingFunc(now, _startTime, _initReleaseAmount, _amount, _interval, _periods);
  }
}