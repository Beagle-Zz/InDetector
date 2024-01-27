contract c12650{
  /**
   * Allow to (re)set finalize agent.
   *
   * Design choice: no state restrictions on setting this, so that we can fix fat finger mistakes.
   */
  function setFinalizeAgent(FinalizeAgent addr) public onlyOwner {
    assert(address(addr) != address(0));
    assert(address(finalizeAgent) == address(0));
    finalizeAgent = addr;
    // Don't allow setting bad agent
    if(!finalizeAgent.isFinalizeAgent()) {
      throw;
    }
  }
}