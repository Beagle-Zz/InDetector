contract c8716{
  /**
   * @dev A distinct URI (RFC 3986) for a given NFT.
   * @param _tokenId Id for which we want uri.
   */
  function tokenURI(
    uint256 _tokenId
  )
    validNFToken(_tokenId)
    external
    view
    returns (string)
  {
    return idToUri[_tokenId];
  }
}