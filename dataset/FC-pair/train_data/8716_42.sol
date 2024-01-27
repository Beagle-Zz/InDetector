contract c8716{
  /**
   * @dev Returns proof for NFT.
   * @param _tokenId Id of the NFT.
   */
  function tokenProof(
    uint256 _tokenId
  )
    validNFToken(_tokenId)
    external
    view
    returns(string)
  {
    return idToProof[_tokenId];
  }
}