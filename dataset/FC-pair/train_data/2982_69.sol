contract c2982{
  /**
   * @dev Allows management to update the default token URI
   * @dev Reverts if not called by owner
   * @param _defaultTokenURI the new default URI to set
   */
  function setDefaultTokenURI(string _defaultTokenURI) external onlyOwner {
    defaultTokenURI = _defaultTokenURI;
  }
}