contract c2166{
  /** The function can be called only by a whitelisted release agent. */
  modifier onlyReleaseAgent() {
    if(msg.sender != releaseAgent) {
      revert();
    }
    _;
  }
}