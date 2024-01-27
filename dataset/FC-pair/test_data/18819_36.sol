contract c18819{
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
  function preallocate(address receiver, uint fullTokens, uint weiPrice) public onlyOwner notFinished {
    require(receiver != address(0));
    uint tokenAmount = fullTokens.mul(10**uint(token.decimals()));
    require(tokenAmount != 0);
    uint weiAmount = weiPrice.mul(tokenAmount); // This can also be 0, in which case we give out tokens for free
    updateInvestorFunds(tokenAmount, weiAmount, receiver , 0);
  }
}