contract c11122{
  /**
   * @dev Get the amount filled for the given order.
   * @param tokenGet   address
   * @param amountGet  uint256
   * @param tokenGive  address
   * @param amountGive uint256
   * @param expires    uint256
   * @param nonce      uint256
   * @param user       address
   * @return uint256
   */
  function amountFilled(
    address tokenGet,
    uint256 amountGet,
    address tokenGive,
    uint256 amountGive,
    uint256 expires,
    uint256 nonce,
    address user
  )
    public
    constant
    returns (uint256)
  {
    // User should be whitelisted.
    require(whitelistedUsers[user]);
    // Tokens should be whitelisted.
    require(whitelistedTokens[tokenGet] && whitelistedTokens[tokenGive]);
    // Return the amount filled for the given order.
    return orderFills[user][keccak256(address(this), tokenGet, amountGet, tokenGive, amountGive, expires, nonce)];
  }
}