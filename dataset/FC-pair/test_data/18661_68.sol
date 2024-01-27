contract c18661{
  // @dev Set the hero's name.
  function setHeroName(uint256 _tokenId, string _name)
    onlyOwnerOf(_tokenId)
    public
  {
    tokenIdToHeroInstance[_tokenId].heroName = _name;
  }
}