contract c4986{
  // Change bet expected times
  function setExpectedTimes(uint _EXPECTED_START, uint _EXPECTED_END) public onlyOwnerLevel {
    setExpectedStart(_EXPECTED_START);
    setExpectedEnd(_EXPECTED_END);
  }
}