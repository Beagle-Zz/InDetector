contract c8716{
  /**
   * @dev Revokes a specified NFT.
   * @param _tokenId Id of the NFT we want to revoke.
   */
  function revoke(
    uint256 _tokenId
  )
    validNFToken(_tokenId)
    onlyOwner
    external
  {
    address tokenOwner = idToOwner[_tokenId];
    super._burn(tokenOwner, _tokenId);
    delete data[_tokenId];
    delete config[_tokenId];
    delete idToProof[_tokenId];
  }
}