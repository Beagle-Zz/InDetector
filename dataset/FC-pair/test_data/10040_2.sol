contract c10040{
  // called by the owner on emergency, triggers stopped state
  function halt() external onlyOwner {
    halted = true;
    emit Halted(true);
  }
}