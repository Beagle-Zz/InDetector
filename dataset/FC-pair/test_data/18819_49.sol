contract c18819{
  /**
   * Crowdfund state machine management.
   *
   * This function has the timed transition builtin.
   * So there is no chance of the variable being stale.
   */
  function getState() public view returns (State) {
    if (finalized) return State.Finalized;
    else if (!configured) return State.PendingConfiguration;
    else if (now < startsAt) return State.PreFunding;
    else if (now <= endsAt && !isCrowdsaleFull()) return State.Funding;
    else return State.Success;
  }
}