contract c13638{
  /** Make sure we are not done yet. */
  modifier canMint() {
    if(mintingFinished) throw;
    _;
  }
}