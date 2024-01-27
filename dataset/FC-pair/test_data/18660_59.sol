contract c18660{
  // @dev Get the hero's level.
  function getHeroLevel(uint256 _tokenId)
    external view
    returns (uint32)
  {
    return tokenIdToHeroInstance[_tokenId].currentLevel;
  }
}