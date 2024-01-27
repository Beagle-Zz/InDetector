contract c11542{
  /** Make sure we are not done yet. */
  modifier canMint() {
    if(mintingFinished) revert();
    _;
  }
}