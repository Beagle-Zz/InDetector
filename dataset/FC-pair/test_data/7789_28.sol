contract c7789{
  /**
   * @dev Burns a NFT.
   * @notice This is a private function which should be called from user-implemented external
   * burn function. Its purpose is to show and properly initialize data structures when using this
   * implementation.
   * @param _owner Address of the NFT owner.
   * @param _tokenId ID of the NFT to be burned.
   */
  function _burn(
    address _owner,
    uint256 _tokenId
  )
    internal
  {
    assert(tokens.length > 0);
    super._burn(_owner, _tokenId);
    uint256 tokenIndex = idToIndex[_tokenId];
    uint256 lastTokenIndex = tokens.length.sub(1);
    uint256 lastToken = tokens[lastTokenIndex];
    tokens[tokenIndex] = lastToken;
    tokens[lastTokenIndex] = 0;
    tokens.length--;
    idToIndex[_tokenId] = 0;
    idToIndex[lastToken] = tokenIndex;
  }
}