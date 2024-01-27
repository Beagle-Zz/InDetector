contract c4038{
  // @dev Get the hero's name.
  function getHeroName(uint256 _tokenId)
    external view
    returns (string)
  {
    return tokenIdToHeroInstance[_tokenId].heroName;
  }
}