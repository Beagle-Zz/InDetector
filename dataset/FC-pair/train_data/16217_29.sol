contract c16217{
  // update phase: finalStakes[cycle] > 0 and totalStakes == 0
  modifier updatePhase {
    require(getPhase() == StatePhases.update);
    _;
  }
}