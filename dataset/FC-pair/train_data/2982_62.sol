contract c2982{
  /**
   * @dev Utility function for updating a nickname if you own the token
   * @dev Reverts if not called by owner
   * @param _tokenId the  token ID
   * @param _nickname char stamp of token owner
   */
  function setNickname(uint256 _tokenId, bytes32 _nickname) external onlyOwnerOf(_tokenId) {
    tokenIdToNickname[_tokenId] = _nickname;
  }
}