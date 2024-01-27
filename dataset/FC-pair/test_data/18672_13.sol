contract c18672{
  // Change bet expected end time
  function setExpectedEnd(uint _EXPECTED_END) payable public onlyOwnerLevel {
    require(_EXPECTED_END > EXPECTED_START);
    EXPECTED_END = _EXPECTED_END;
    CANCELATION_DATE = EXPECTED_END + 60 * 60 * 24;
    RETURN_DATE = EXPECTED_END + 60 * 60 * 24 * 30;
    callOracle(EXPECTED_END, ORACLIZE_GAS); // Kickoff Oracle checking for winner
  }
}