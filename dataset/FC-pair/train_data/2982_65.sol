contract c2982{
  /**
   * @dev checks for owned tokens
   * @param _owner address to query
   */
  function firstToken(address _owner) public view returns (uint256 _tokenId) {
    require(hasTokens(_owner));
    return ownedTokens[_owner][0];
  }
}