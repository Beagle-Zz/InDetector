contract c18866{
  /// Check for token ownership
  function _owns(address claimant, uint256 _tokenId) private view returns (bool) {
    return claimant == cardTokenToOwner[_tokenId];
  }
}