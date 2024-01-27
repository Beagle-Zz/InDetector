contract c13779{
  ///////////////////////////////////////////////////////////
  /// Private Function
  ///////////////////////////////////////////////////////////
  function tokenIsComponent(address _tokenAddress) view internal returns (bool) {
    return isComponent[keccak256(_tokenAddress)];
  }
}