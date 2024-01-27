contract c2449{
  /**
   * function createTokenContract - Mintable Token Created
   */
  function createTokenContract() internal returns (MintableToken) {
    return new MintableToken();
  }
}