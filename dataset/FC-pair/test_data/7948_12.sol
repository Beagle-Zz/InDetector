contract c7948{
  // Change bet expected start time
  function setExpectedStart(uint _EXPECTED_START) public onlyOwnerLevel {
    EXPECTED_START = _EXPECTED_START;
    BETTING_CLOSES = EXPECTED_START - 60;
  }
}