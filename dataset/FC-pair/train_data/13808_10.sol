contract c13808{
  /**
   * Set the contract that can call release and make the token transferable.
   *
   * Design choice. Allow reset the release agent to fix fat finger mistakes.
   */
  function setReleaseAgent(address addr) onlyOwner inReleaseState(false) public {
    require(addr != 0x0);
    // We don't do interface check here as we might want to a normal wallet address to act as a release agent
    releaseAgent = addr;
  }
}