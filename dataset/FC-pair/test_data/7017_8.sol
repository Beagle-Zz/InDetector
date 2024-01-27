contract c7017{
  /**
   * @dev Guarantees that _tokenId is a valid Token.
   * @param _tokenId ID of the NFT to validate.
   */
  modifier validNFToken(
    uint256 _tokenId
  ) {
    require(idToOwner[_tokenId] != address(0));
    _;
  }
}