contract c7017{
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
    super._burn(_owner, _tokenId);
    assert(tokens.length > 0);
    uint256 tokenIndex = idToIndex[_tokenId];
    // Sanity check. This could be removed in the future.
    assert(tokens[tokenIndex] == _tokenId);
    uint256 lastTokenIndex = tokens.length.sub(1);
    uint256 lastToken = tokens[lastTokenIndex];
    tokens[tokenIndex] = lastToken;
    tokens.length--;
    // Consider adding a conditional check for the last token in order to save GAS.
    idToIndex[lastToken] = tokenIndex;
    idToIndex[_tokenId] = 0;
  }
}