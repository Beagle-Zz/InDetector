contract c7227{
  // update startTime, endTime for post-sales
  function setSalePeriod(uint256 _startTime, uint256 _endTime) public onlyOwner {
    require(!isFinalized);
    require(_startTime > 0);
    require(_endTime > _startTime);
    startTime = _startTime;
    endTime = _endTime;
  }
}