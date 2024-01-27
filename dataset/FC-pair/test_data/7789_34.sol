contract c7789{
  /**
   * @dev Burns a NFT.
   * @notice This is a internal function which should be called from user-implemented external
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
    if (bytes(idToUri[_tokenId]).length != 0) {
      delete idToUri[_tokenId];
    }
  }
}