contract c8716{
  /**
   * @dev Returns convention data value for a given index field.
   * @param _tokenId Id of the NFT we want to get value for key.
   * @param _index for which we want to get value.
   */
  function tokenDataValue(
    uint256 _tokenId,
    uint256 _index
  )
    validNFToken(_tokenId)
    public
    view
    returns(bytes32 value)
  {
    require(_index < data[_tokenId].length);
    value = data[_tokenId][_index];
  }
}