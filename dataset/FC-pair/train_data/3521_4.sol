contract c3521{
  /**
   * @dev Since name is passed into the ERC721 token constructor, it's not stored in the CodexRecordProxy
   *  contract. Thus, we call into the contract directly to retrieve its value.
   * @return string The name of the token
   */
  function name() external view returns (string) {
    ERC721Metadata tokenMetadata = ERC721Metadata(implementation);
    return tokenMetadata.name();
  }
}