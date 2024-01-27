contract c7076{
  // @dev Get the hero's BP.
  function getHeroBP(uint256 _tokenId)
    public view
    returns (uint32)
  {
    var _tmp = tokenIdToHeroInstance[_tokenId].currentStats;
    return (_tmp[0] + _tmp[1] + _tmp[2] + _tmp[3] + _tmp[4]);
  }
}