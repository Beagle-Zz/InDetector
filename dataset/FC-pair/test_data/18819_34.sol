contract c18819{
  /*
   * The configuration from the constructor was moved to the configurationGenericCrowdsale function.
   *
   * @param team_multisig Address of the multisignature wallet of the team that will receive all the funds contributed in the crowdsale.
   * @param start Timestamp where the crowdsale will be officially started. It should be greater than the timestamp in which the contract is deployed.
   * @param end Timestamp where the crowdsale finishes. No tokens can be sold through this contract after this timestamp.
   *
   * configurationGenericCrowdsale can only be called when in State.PendingConfiguration because of the inState modifier.
   */
  function configurationGenericCrowdsale(address team_multisig, uint start, uint end) internal inState(State.PendingConfiguration) {
    setMultisig(team_multisig);
    // Don't mess the dates
    require(start != 0 && end != 0);
    require(now < start && start < end);
    startsAt = start;
    endsAt = end;
    configured = true;
  }
}