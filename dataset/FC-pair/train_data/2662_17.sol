contract c2662{
  /** The function can be called only before or after the tokens have been releasesd */
  modifier inReleaseState(bool releaseState) {
    if(releaseState != released) {
      revert();
    }
    _;
  }
}