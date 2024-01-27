contract c13012{
  /// @dev returns true iff token is supperted by this contract (for erc223/677 tokens calls)
  /// @param token can be token1 or token2
  function supportsToken(address token) public constant returns (bool) {
    return (token1 == token || token2 == token);
  }
}