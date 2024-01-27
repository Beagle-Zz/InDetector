contract c8643{
  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply () public delegatable view returns (uint256) {
    return tokensCount;
  }
}