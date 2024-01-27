contract c9583{
  // @dev Add exp.
  //  This is intended to be called by Dungeon, Arena, Guild contracts.
  function addExp(uint256 _tokenId, uint32 _exp)
    onlyAccessDeploy
    public
    returns (bool)
  {
    // The hero should be possessed by anybody.
    require(ownerOf(_tokenId) != address(0));
    var _heroInstance = tokenIdToHeroInstance[_tokenId];
    var _newExp = _heroInstance.currentExp + _exp;
    // Sanity check to ensure we don't overflow.
    require(_newExp == uint256(uint128(_newExp)));
    _heroInstance.currentExp += _newExp;
  }
}