contract c7789{
  /**
   * @return true if crowdsale event has ended
   */
  function hasEnded()
    external
    view
    returns (bool)
  {
    bool capReached = zxcSold >= crowdSaleZxcSupply;
    bool endTimeReached = now >= endTime;
    return capReached || endTimeReached;
  }
}