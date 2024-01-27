contract c10040{
  /**
   * Preallocate tokens for the early investors.
   *
   * Preallocated tokens have been sold before the actual crowdsale opens.
   * This function mints the tokens and moves the crowdsale needle.
   *
   * No money is exchanged, as the crowdsale team already have received the payment.
   *
   * @param receiver Account that receives the tokens.
   * @param fullTokens tokens as full tokens - decimal places are added internally.
   * @param weiPrice Price of a single indivisible token in wei.
   *
   */
  function preallocate(address receiver, uint fullTokens, uint weiPrice) external onlyOwner notFinished {
    uint tokenAmount = fullTokens.mul(10**uint(token.decimals()));
    // weiAmount can also be 0, in which case weiRaised is not increased.
    uint weiAmount = weiPrice.mul(tokenAmount);
    granularPreallocate(receiver, tokenAmount, weiAmount);
  }
}