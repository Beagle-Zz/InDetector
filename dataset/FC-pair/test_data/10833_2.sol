contract c10833{
  // called by the owner on emergency, triggers stopped state
  function halt() external onlyOwner inNormalState {
    halted = true;
  }
}