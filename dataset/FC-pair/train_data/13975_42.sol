contract c13975{
  /** Check that we can release the token */
  function isSane() public constant returns (bool) {
    return (token.releaseAgent() == address(this));
  }
}