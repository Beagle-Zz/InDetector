contract c7066{
  /**
   * Get name of the token.
   *
   * @return name of the token
   */
  function name () public delegatable view returns (string) {
    return "STASIS EURS Token";
  }
}