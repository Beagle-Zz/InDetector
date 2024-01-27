contract c18771{
  // must return true if crowdsale completed successfully
  function isSuccessful()
    public
    constant
    returns(bool)
  {
    return (
      // either the hard cap is collected
      totalCollected >= hardCap ||
      // ...or the crowdfunding period is over, but the minimum has been reached
      (block.timestamp >= endTimestamp && totalCollected >= minimalGoal)
    );
  }
}