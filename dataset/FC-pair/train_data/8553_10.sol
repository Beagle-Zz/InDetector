contract c8553{
  /**
   * Set the contract that can call release and make the token transferable.
   */
  function setReleaseAgent(address addr) onlyOwner inReleaseState(false) public {
    // We don't do interface check here as we might want to a normal wallet address to act as a release agent
    releaseAgent = addr;
  }
}