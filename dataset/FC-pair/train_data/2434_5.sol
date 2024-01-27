contract c2434{
  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply() constant returns (uint256 supply) {
    return tokenCount;
  }
}