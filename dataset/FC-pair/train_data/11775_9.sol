contract c11775{
  /**
   * @dev Calculate tokens user will have for their purchase
   *
   * @param weisTotal How much ethers (in wei) the user putssssss in
   * @param pricePerToken What is the price for one token
   *
   * @return tokensTotal which is received tokens, token decimals included
   */
  function calculateTokens(uint256 weisTotal, uint256 pricePerToken) public constant returns(uint tokensTotal) {
    // pricePerToken is how many full tokens, token decimal place included, you get for wei amount.
    // Because, in theory, decimal amount can vary, we do the exponent calculation here,
    // though gas wise using 10**18 constant would be much simpler.
    // Furthermore we could use rough amounts and take in raw wei per tokens amount,
    // but we lose too much accuracy for generic calculations, thus all these are
    // practically implemented as 10**18 fixed points.
    uint multiplier = 10 ** token.decimals();
    return weisTotal.times(multiplier)/pricePerToken;
  }
}