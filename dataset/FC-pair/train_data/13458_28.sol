contract c13458{
  /**
   * Transfer tokens from approve() pool to the buyer.
   *
   * Use approve() given to this crowdsale to distribute the tokens.
   */
  function assignTokens(address receiver, uint tokenAmount) internal {
    if(!token.transferFrom(beneficiary, receiver, tokenAmount)) throw;
  }
}