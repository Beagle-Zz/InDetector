contract c4055{
  // @dev Get the hero's required gold for level up.
  function getHeroRequiredGoldForLevelUp(uint256 _tokenId)
    public view
    returns (uint256)
  {
    return (uint256(2) ** (tokenIdToHeroInstance[_tokenId].currentLevel / 10)) * requiredGoldIncreaseFactor;
  }
}