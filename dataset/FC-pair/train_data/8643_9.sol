contract c8643{
  /**
   * Get name of the token.
   *
   * @return name of the token
   */
  function name () public delegatable view returns (string) {
    return "GHI Token";
  }
}