contract c2005{
  //@dev internal funcion to set the outcome sat
  function _setOutcome(int _outcome) internal {
    isSet = true;
    outcome = _outcome;
    emit OutcomeAssignment(_outcome);
  }
}