contract c2325{
  /**
   * Set the current state of the crowdsale.
   */
  function setCrowdsaleState() public {
    if (weiRaised >= hardCap && crowdsaleState != state.crowdsaleEnded) {
      crowdsaleState = state.crowdsaleEnded;
      emit HardCapReached(block.timestamp);
      emit DipTgeEnded(block.timestamp);
    } else if (
      block.timestamp >= startTime &&
      block.timestamp < startOpenPpTime &&
      crowdsaleState != state.priorityPass
    ) {
      crowdsaleState = state.priorityPass;
      emit DipTgeStarted(block.timestamp);
    } else if (
      block.timestamp >= startOpenPpTime &&
      block.timestamp <= endTime &&
      crowdsaleState != state.crowdsale
    ) {
      crowdsaleState = state.crowdsale;
      emit CrowdsaleStarted(block.timestamp);
    } else if (
      crowdsaleState != state.crowdsaleEnded &&
      block.timestamp > endTime
    ) {
      crowdsaleState = state.crowdsaleEnded;
      emit DipTgeEnded(block.timestamp);
    }
  }
}