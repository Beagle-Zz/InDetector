contract c14437{
  /// @notice Returns all the relevant information about a specific collection.
  /// @param _collectionId The tokenId of the collection of interest.
  function getCollection(uint256 _collectionId) public view returns (
    uint256 id,
    string collectionName,
    uint256[] editionIds
  ) {
    Collection storage collection = allCollections[_collectionId-1];
    id = collection.id;
    collectionName = collection.name;
    editionIds = collection.editionIds;
  }
}