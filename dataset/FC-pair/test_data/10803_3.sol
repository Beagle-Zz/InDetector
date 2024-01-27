contract c10803{
  // called by the owner on end of emergency, returns to normal state
  function unhalt() external onlyOwner inEmergencyState {
    halted = false;
  }
}