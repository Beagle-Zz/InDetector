contract c9208{
  /**
   * Finalize a succcesful crowdsale.
   *
   * The owner can triggre a call the contract that provides post-crowdsale actions, like releasing the tokens.
   */
  function finalize() public inState(State.Success) onlyOwner stopInEmergency {
    // Already finalized
    if (finalized) {
      revert();
    }
    // Finalizing is optional. We only call it if we are given a finalizing agent.
    if (address(finalizeAgent) != 0) {
      finalizeAgent.finalizeCrowdsale();
    }
    finalized = true;
  }
}