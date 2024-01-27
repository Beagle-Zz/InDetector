contract c11142{
  /// @dev Returns the API URL for a given token Id.
  ///   ex: https://us-central1-cryptostrikers-api.cloudfunctions.net/cards/22
  ///   Right now, this endpoint returns a JSON blob conforming to OpenSea's spec.
  ///   see: https://docs.opensea.io/docs/2-adding-metadata
  function tokenURI(uint256 _tokenId) external view returns (string) {
    string memory _id = uint2str(_tokenId);
    return strConcat(apiUrl, _id);
  }
}