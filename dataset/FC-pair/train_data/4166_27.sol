contract c4166{
  /**
   * @dev Updates token metadata hashes to whatever is passed in
   * @param _tokenId uint256 The token ID
   * @param _newNameHash bytes32 The new sha3 hash of the name
   * @param _newDescriptionHash bytes32 The new sha3 hash of the description
   * @param _newFileHashes bytes32[] The new sha3 hashes of the files associated with the token
   * @param _data (optional) bytes Additional data that will be emitted with the Modified event
   */
  function modifyMetadataHashes(
    uint256 _tokenId,
    bytes32 _newNameHash,
    bytes32 _newDescriptionHash,
    bytes32[] _newFileHashes,
    bytes _data
  )
    public
    onlyOwnerOf(_tokenId)
  {
    // nameHash is only overridden if it's not a blank string, since name is a
    //  required value. Emptiness is determined if the first element is the null-byte
    if (!bytes32IsEmpty(_newNameHash)) {
      tokenData[_tokenId].nameHash = _newNameHash;
    }
    // descriptionHash can always be overridden since it's an optional value
    //  (e.g. you can "remove" a description by setting it to a blank string)
    tokenData[_tokenId].descriptionHash = _newDescriptionHash;
    // fileHashes is only overridden if it has one or more value, since at
    //  least one file (i.e. mainImage) is required
    bool containsNullHash = false;
    for (uint i = 0; i < _newFileHashes.length; i++) {
      if (bytes32IsEmpty(_newFileHashes[i])) {
        containsNullHash = true;
        break;
      }
    }
    if (_newFileHashes.length > 0 && !containsNullHash) {
      tokenData[_tokenId].fileHashes = _newFileHashes;
    }
    emit Modified(
      msg.sender,
      _tokenId,
      tokenData[_tokenId].nameHash,
      tokenData[_tokenId].descriptionHash,
      tokenData[_tokenId].fileHashes,
      _data
    );
  }
}