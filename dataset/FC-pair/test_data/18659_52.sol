contract c18659{
  // @dev Get the hero's class id.
  function getHeroClassId(uint256 _tokenId)
    external view
    returns (uint32)
  {
    return tokenIdToHeroInstance[_tokenId].heroClassId;
  }
}