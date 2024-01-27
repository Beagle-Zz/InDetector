contract c8643{
  /**
   * Get number of decimals for the token.
   *
   * @return number of decimals for the token
   */
  function decimals () public delegatable view returns (uint8) {
    return 2;
  }
}