contract c2982{
  /**
   * @dev Utility function for updating an assets token URI
   * @dev Reverts if not called by management
   * @param _tokenId the token ID
   * @param _uri the token URI, will be concatenated with baseUri
   */
  function setTokenURI(uint256 _tokenId, string _uri) external onlyIfWhitelisted(msg.sender) {
    require(exists(_tokenId));
    _setTokenURI(_tokenId, _uri);
  }
}