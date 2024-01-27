contract c4662{
  /// @notice Returns all the relevant information about a specific person.
  /// @param _tokenId The tokenId of the person of interest.
  function getPerson(uint256 _tokenId) public view returns (
    string personName,
    uint256 sellingPrice,
    address owner
  ) {
    Person storage person = persons[_tokenId];
    personName = person.name;
    sellingPrice = personIndexToPrice[_tokenId];
    owner = personIndexToOwner[_tokenId];
  }
}