contract c2982{
  /**
   * @dev checks for owned tokens
   * @param _owner address to query
   */
  function hasTokens(address _owner) public view returns (bool) {
    return ownedTokens[_owner].length > 0;
  }
}