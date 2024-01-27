contract c8716{
  /**
   * @dev Modifies convention data by setting a new value for a given index field.
   * @param _tokenId Id of the NFT we want to set key value data.
   * @param _data New token data.
   */
  function setTokenData(
    uint256 _tokenId,
    bytes32[] _data
  )
    validNFToken(_tokenId)
    isAuthorized()
    external
  {
    data[_tokenId] = _data;
    emit TokenDataChange(_tokenId, _data);
  }
}