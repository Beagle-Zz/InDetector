contract c10040{
  /**
   * Create new tokens and allocate them to an address.
   *
   * Only callable by a mint agent (e.g. crowdsale contract).
   */
  function mint(address receiver, uint amount) onlyMintAgent canMint public {
    mintInternal(receiver, amount);
  }
}