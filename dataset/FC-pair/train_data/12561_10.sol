contract c12561{
  /*
  math function used to calculate vesting curve
  */
  function vestingFunc(uint256 _currentTime, uint256 _startTime, uint256 _initReleaseAmount, uint256 _amount, uint256 _interval, uint256 _periods) public pure returns (uint256) {
    if (_currentTime < _startTime) {
      return 0;
    }
    uint256 t = _currentTime.sub(_startTime);
    uint256 end = _periods.mul(_interval);
    if (t >= end) {
      return _amount;
    }
    uint256 i_amount = _amount.sub(_initReleaseAmount).div(_periods);
    uint256 i = t.div(_interval);
    return i_amount.mul(i).add(_initReleaseAmount);
  }
}