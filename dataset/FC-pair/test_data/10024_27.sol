contract c10024{
  /**
   * Dynamically create tokens and assign them to the investor.
   */
  function assignTokens(address receiver, uint tokenAmount) private {
    MintableTokenExt mintableToken = MintableTokenExt(token);
    mintableToken.mint(receiver, tokenAmount);
  }
}