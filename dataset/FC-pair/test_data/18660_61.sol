contract c18660{
  // @dev Get the time when the hero become available.
  function getHeroAvailableAt(uint256 _tokenId)
    external view
    returns (uint256)
  {
    return tokenIdToHeroInstance[_tokenId].availableAt;
  }
}