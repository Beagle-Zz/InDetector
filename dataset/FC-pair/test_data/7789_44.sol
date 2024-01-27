contract c7789{
  /**
   * @dev Returns expiration date from 0 index of token config values.
   * @param _tokenId Id of the NFT we want to get expiration time of.
   */
  function tokenExpirationTime(
    uint256 _tokenId
  )
    validNFToken(_tokenId)
    external
    view
    returns(bytes32)
  {
    return config[_tokenId][0];
  }
}