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
   * @param tokenAmount Indivisible tokens.
   * @param weiAmount Equivalent of tokens in wei.
   *
   */
  function granularPreallocate(address receiver, uint tokenAmount, uint weiAmount) public onlyOwner notFinished {
    require(receiver != address(0));
    require(tokenAmount != 0);
    updateInvestorFunds(tokenAmount, weiAmount, receiver , 0);
  }
}