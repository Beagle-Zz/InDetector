contract c8643{
  /**
   * Get symbol of the token.
   *
   * @return symbol of the token
   */
  function symbol () public delegatable view returns (string) {
    return "GHI";
  }
}