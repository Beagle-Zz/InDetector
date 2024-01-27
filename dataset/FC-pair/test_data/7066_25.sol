contract c7066{
  /**
   * Get current nonce for token holder with given address, i.e. nonce this
   * token holder should use for next delegated transfer.
   *
   * @param _owner address of the token holder to get nonce for
   * @return current nonce for token holder with give address
   */
  function nonce (address _owner) public view delegatable returns (uint256) {
    return nonces [_owner];
  }
}