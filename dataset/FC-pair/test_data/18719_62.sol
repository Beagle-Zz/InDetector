contract c18719{
  // These two setters are present only to correct timestamps if they are off from their target date by more than, say, a day
  function setStartingTime(uint startingTime) public onlyOwner inState(State.PreFunding) {
    require(now < startingTime && startingTime < endsAt);
    startsAt = startingTime;
  }
}