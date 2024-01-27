contract c12716{
  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply () public view returns (uint256 supply) {
    return tokenCount;
  }
}