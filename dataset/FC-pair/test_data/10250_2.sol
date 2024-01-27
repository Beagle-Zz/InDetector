contract c10250{
  // called by the owner on emergency, triggers stopped state
  function halt() external onlyOwner {
    halted = true;
  }
}