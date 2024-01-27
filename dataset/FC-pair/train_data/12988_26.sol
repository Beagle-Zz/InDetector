contract c12988{
  // opposite of canMint used for restarting the mint
  modifier cantMint() {
    require(mintingFinished);
    _;
  }
}