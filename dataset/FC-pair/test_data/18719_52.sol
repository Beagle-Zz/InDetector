contract c18719{
  /** Modifier allowing execution only if the crowdsale is currently running.  */
  modifier notFinished() {
    State current_state = getState();
    require(current_state == State.PreFunding || current_state == State.Funding);
    _;
  }
}