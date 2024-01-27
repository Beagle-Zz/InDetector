contract c16217{
  // bankroll phase: initialStakes[cycle] > 0 and finalStakes[cycle] == 0
  modifier bankrollPhase {
    require(getPhase() == StatePhases.bankroll);
    _;
  }
}