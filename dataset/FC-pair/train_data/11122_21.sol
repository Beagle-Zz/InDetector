contract c11122{
  /**
   * @dev Place a new order to the this contract. 
   * @param tokenGet   address
   * @param amountGet  uint256
   * @param tokenGive  address
   * @param amountGive uint256
   * @param expires    uint256
   * @param nonce      uint256
   */
  function order(
    address tokenGet,
    uint256 amountGet,
    address tokenGive,
    uint256 amountGive,
    uint256 expires,
    uint256 nonce
  )
    public
  {
    // Order placer address should be whitelisted.
    require(whitelistedUsers[msg.sender]);
    // Order tokens addresses should be whitelisted. 
    require(whitelistedTokens[tokenGet] && whitelistedTokens[tokenGive]);
    // Calculate the order hash.
    bytes32 hash = keccak256(address(this), tokenGet, amountGet, tokenGive, amountGive, expires, nonce);
    // Store the order.
    orders[msg.sender][hash] = true;
    // Trigger the event.
    Order(tokenGet, amountGet, tokenGive, amountGive, expires, nonce, msg.sender);
  }
}