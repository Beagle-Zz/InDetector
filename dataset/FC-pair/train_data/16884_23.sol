contract c16884{
  // called by CrowdsaleController to setup start and end time of crowdfunding process
  // as well as funding address (where to transfer ETH upon successful crowdsale)
  function start(
    uint256 _startTimestamp,
    uint256 _endTimestamp,
    address _fundingAddress
  )
    public
    onlyManager()   // manager is CrowdsaleController instance
    hasntStarted()  // not yet started
    hasntStopped()  // crowdsale wasn't cancelled
  {
    require(_fundingAddress != address(0));
    // start time must not be earlier than current time
    require(_startTimestamp >= block.timestamp);
    // range must be sane
    require(_endTimestamp > _startTimestamp);
    duration = _endTimestamp - _startTimestamp;
    // duration must fit constraints
    require(duration >= MIN_CROWDSALE_TIME && duration <= MAX_CROWDSALE_TIME);
    startTimestamp = _startTimestamp;
    endTimestamp = _endTimestamp;
    fundingAddress = _fundingAddress;
    // now crowdsale is considered started, even if the current time is before startTimestamp
    started = true;
    emit CROWDSALE_START(_startTimestamp, _endTimestamp, _fundingAddress);
  }
}