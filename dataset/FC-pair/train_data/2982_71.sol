contract c2982{
  /**
   * @dev Return blockhash of the  token
   * @param _tokenId the token ID
   */
  function blockhashOf(uint256 _tokenId) public view returns (bytes32 hash) {
    return tokenIdToBlockhash[_tokenId];
  }
}