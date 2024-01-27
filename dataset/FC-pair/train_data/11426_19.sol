contract c11426{
  /**
   *  MintableToken functionality
   */
  modifier canMint() {
    require(!mintingFinished);
    _;
  }
}