contract c12233{
  // must return true if crowdsale is active (i.e. the token can be bought)
  function isActive()
    public
    constant
    returns(bool)
  {
    return (
      // it was started
      started &&
      // hard cap wasn't reached yet
      totalCollected < hardCap &&
      // and current time is within the crowdfunding period
      block.timestamp >= startTimestamp &&
      block.timestamp < endTimestamp
    );
  }
}