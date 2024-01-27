contract c13487{
  /**
   * @dev Make an investment based on pricing strategy
   *
   * This is a wrapper for buyTokens(), but the amount of tokens receiver will
   * have depends on the pricing strategy used.
   *
   * @param receiver The Ethereum address who receives the tokens
   * @param customerId (optional) UUID v4 to track the successful payments on the server side'
   *
   * @return tokensBought How mony tokens were bought
   */
  function investInternal(address receiver, uint128 customerId) stopInEmergency internal returns(uint tokensBought) {
    return buyTokens(receiver, customerId, pricingStrategy.calculatePrice(msg.value, weiRaised - presaleWeiRaised, tokensSold, msg.sender, token.decimals()));
  }
}