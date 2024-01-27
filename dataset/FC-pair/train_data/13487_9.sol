contract c13487{
  /**
   * @dev Calculate tokens user will have for theirr purchase
   *
   * @param weisTotal How much ethers (in wei) the user putssssss in
   * @param pricePerToken What is the price for one token
   *
   * @return tokensTotal which is weisTotal divided by pricePerToken
   */
  function calculateTokens(uint256 weisTotal, uint256 pricePerToken) public constant returns(uint tokensTotal) {
    return weisTotal/pricePerToken;
  }
}