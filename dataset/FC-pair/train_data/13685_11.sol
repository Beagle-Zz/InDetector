contract c13685{
  /** Make sure we are not done yet. */
  modifier canMint() {
    if(mintingFinished) revert();
    _;
  }
}