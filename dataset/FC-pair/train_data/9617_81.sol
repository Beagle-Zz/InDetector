contract c9617{
  // @dev Get the hero's stats and some other infomation.
  function getCorrectedStats(uint256 _tokenId)
    external view
    returns (uint32 currentLevel, uint32 currentExp, uint32[5] currentStats, uint32[5] ivs, uint32 bp)
  {
    var (, , _currentLevel, _currentExp, , , _currentStats, _ivs, ) = heroContract.getHeroInfo(_tokenId);
    if (_currentLevel != 1) {
      for (uint8 i = 0; i < 5; i ++) {
        _currentStats[i] += _ivs[i];
      }
    }
    var _bp = _currentStats[0] + _currentStats[1] + _currentStats[2] + _currentStats[3] + _currentStats[4];
    return (_currentLevel, _currentExp, _currentStats, _ivs, _bp);
  }
}