contract c12988{
  // Allow owner or contract to finish minting.
  function finishMinting() onlyOwner canMint public returns (bool) {
    return super.finishMinting();
  }
}