contract c2982{
  /**
   * @dev Return blockhash of the  token
   * @param _tokenId the token ID
   */
  function burn(uint256 _tokenId) public {
    super._burn(msg.sender, _tokenId);
    bytes32 tokenBlockhash = tokenIdToBlockhash[_tokenId];
    if (tokenIdToBlockhash[_tokenId].length != 0) {
      delete tokenIdToBlockhash[_tokenId];
    }
    if (tokenIdToNickname[_tokenId].length != 0) {
      delete tokenIdToNickname[_tokenId];
    }
    if (blockhashToTokenId[tokenBlockhash] != 0) {
      delete blockhashToTokenId[tokenBlockhash];
    }
  }
}